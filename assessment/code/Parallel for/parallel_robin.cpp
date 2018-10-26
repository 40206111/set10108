#include <iostream>
#include <string>
#include <fstream>
#include <chrono>
#include <omp.h>
#include "block_chain.h"

using namespace std;
using namespace std::chrono;

int main()
{
    block_chain bchain;
	std::ofstream file;

	//open file to hold data
	//bchain.file.open("sequential-5.csv");
	file.open("parallel_robin-0.csv");

	for (uint32_t j = 0; j < 100u; ++j)
	{
		auto start = system_clock::now();

	//begin parallel for
#pragma omp parallel for num_threads(num_threads) schedule(static, 1)
		for (uint32_t i = 1; i < 11u; ++i)
		{
			cout << "Mining block " << i << "..." << endl;
			bchain.add_block(block(i, string("Block ") + to_string(i) + string(" Data")));
		}
		//bchain.file << endl;
		auto end = system_clock::now();
		duration<double> diff = end - start;
		//write total time to file
		file << diff.count() << ",";
	}

	//close file to hold data
	file.close();
	//bchain.file.close();
    return 0;
}