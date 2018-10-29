#include <iostream>
#include <mpi.h>

using namespace std;

int main(int argc, char **argv)
{
	auto result = MPI_Init(nullptr, nullptr);

	if (result != MPI_SUCCESS)
	{
		cout << "ERROR - initialising MPI!" << endl;
		MPI_Abort(MPI_COMM_WORLD, result);
		return -1;
	}

	int num_procs, rank, length;
	char host_name[MPI_MAX_PROCESSOR_NAME];
	MPI_Comm_size(MPI_COMM_WORLD, &num_procs);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Get_processor_name(host_name, &length);

	cout << "number of processors = " << num_procs << endl;
	cout << "My rank = " << rank << endl;
	cout << "Running on = " << host_name << endl;

	MPI_Finalize();

	return 0;
}