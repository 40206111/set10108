#include <iostream>
#include <string>
#include "block_chain.h"

using namespace std;

int main()
{
    block_chain bchain;
	
	//open file to hold data
	bchain.file.open("sequential-5.csv");
	for (uint32_t j = 0; j < 100u; ++j)
	{
		for (uint32_t i = 1; i < 11u; ++i)
		{
			cout << "Mining block " << i << "..." << endl;
			bchain.add_block(block(i, string("Block ") + to_string(i) + string(" Data")));
		}
		bchain.file << endl;
	}

	//close file to hold data
	bchain.file.close();
    return 0;
}