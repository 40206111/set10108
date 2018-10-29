#include <mpi.h>
#include <iostream>
#include <sstream>

using namespace std;

const unsigned int MAX_STRING = 100;
int main(int argc, char **argv)
{
	int num_procs, my_rank;

	auto result = MPI_Init(nullptr, nullptr);
	if (result != MPI_SUCCESS)
	{
		cout << "ERROR - initialisting MPI" << endl;
		MPI_Abort(MPI_COMM_WORLD, result);
		return -1;
	}

	MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

	if (my_rank != 0)
	{
		stringstream buffer;
		buffer << "Hakuna Matata from " << my_rank << " of " << num_procs << "!";

		auto data = buffer.str().c_str();

		MPI_Send((void*)data, buffer.str().length() + 1, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
	}
	else
	{
		cout << "Sup from " << my_rank << " of " << num_procs << "!" << endl;

		char message[MAX_STRING];
		for (int i = 1; i < num_procs; ++i)
		{
			MPI_Recv(message, MAX_STRING, MPI_CHAR, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
			cout << message << endl;
		}
	}

	MPI_Finalize();

	return 0;

}