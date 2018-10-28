#include <iostream>
#include <string>
#include <fstream>
#include <chrono>
#include "block_chain.h"

using namespace std;
using namespace std::chrono;

int main()
{
	std::ofstream file;

	//open file to hold data
	file.open("parallel_static-0-overall.csv");

	for (uint32_t j = 0; j < 100u; ++j)
	{
		block_chain bchain;
		bchain.file.open("parallel_static-0.csv", ios::app);

		auto start = system_clock::now();

		for (uint32_t i = 1; i < 11u; ++i)
		{
			cout << "Mining block " << i << "..." << endl;
			bchain.add_block(block(i, string("Block ") + to_string(i) + string(" Data")));
		}
		bchain.file << endl;
		auto end = system_clock::now();
		duration<double> diff = end - start;
		//write total time to file
		file << diff.count() << ",";

		bchain.file.close();
	}

	//close file to hold data

	file.close();
	return 0;
}