#include <mpi.h>
#include <iostream>
#include <vector>
#include <chrono>
#include <random>

using namespace std;
using namespace chrono;

constexpr size_t SIZE = 1 << 20;

void generate_data(vector<float> &data)
{
	auto millis = duration_cast<milliseconds>(system_clock::now().time_since_epoch());
	default_random_engine e(static_cast<unsigned int>(millis.count()));
	for (unsigned int i = 0; i < data.size(); ++i)
	{
		data[i] = e();
	}
}

void normalise_vector(vector<float> &data)
{
	for (unsigned int i = 0; i < (data.size() / 4); ++i)
	{
		float sum = 0.0f;
		for (unsigned int j = 0; j < 4; ++j)
		{
			sum += powf(data[(i * 4) + j], 2.0f);
		}
		sum = sqrtf(sum);

		for (unsigned int j = 0; j < 4; ++j)
		{
			data[(i * 4) + j] /= sum;
		}
	}
}

int main(int argc, char **argv)
{
	auto result = MPI_Init(nullptr, nullptr);
	if (result != MPI_SUCCESS)
	{
		cout << "ERROR - initialising MPI" << endl;
		MPI_Abort(MPI_COMM_WORLD, result);
		return -1;
	}

	int num_procs, my_rank;
	MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
	MPI_Comm_size(MPI_COMM_WORLD, &num_procs);

	vector<float> data;
	vector<float> my_data(SIZE / num_procs);

	if (my_rank == 0)
	{
		data.resize(SIZE);
		generate_data(data);
		MPI_Scatter(&data[0], SIZE / num_procs, MPI_FLOAT,
			&my_data[0], SIZE / num_procs, MPI_FLOAT,
			0, MPI_COMM_WORLD);
	}
	else
	{
		MPI_Scatter(nullptr, SIZE / num_procs, MPI_FLOAT,
			&my_data[0], SIZE / num_procs, MPI_FLOAT,
			0, MPI_COMM_WORLD);
	}

	normalise_vector(my_data);

	if (my_rank == 0)
	{
		MPI_Gather(&my_data[0], SIZE / num_procs, MPI_FLOAT,
			&data[0], SIZE / num_procs, MPI_FLOAT, 0, MPI_COMM_WORLD);
	}
	else
	{
		MPI_Gather(&my_data[0], SIZE / num_procs, MPI_FLOAT,
			nullptr, SIZE / num_procs, MPI_FLOAT,
			0, MPI_COMM_WORLD);
	}

	// Check if main process
	if (my_rank == 0)
	{
		// Display results - first 10
		for (unsigned int i = 0; i < 10; ++i)
		{
			cout << "<";
			for (unsigned int j = 0; j < 3; ++j)
				cout << data[(i * 4) + j] << ", ";
			cout << data[(i * 4) + 3] << ">" << endl;
		}
	}

	// Shutdown MPI
	MPI_Finalize();

	return 0;
}