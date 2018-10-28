#include "block_chain.h"
#include "sha256.h"

#include <iostream>
#include <sstream>
#include <chrono>
#include <omp.h>
#include <thread>

using namespace std;
using namespace std::chrono;

// Note that _time would normally be set to the time of the block's creation.
// This is part of the audit a block chain.  To enable consistent results
// from parallelisation we will just use the index value, so time increments
// by one each time: 1, 2, 3, etc.
block::block(uint32_t index, const string &data)
	: _index(index), _data(data), _nonce(0), _time(static_cast<long>(index))
{
}

//updated to take in file that holds data
void block::mine_block(uint32_t difficulty, ofstream *file) noexcept
{
	string str(difficulty, '0');

	auto start = system_clock::now();

	//attempts in for loop for every itteration of while loop
	int attempts = 100;
	int initial = 0;
	int increase = attempts;
	//string to store temp hash so each thread can have its own copy
	string temp_hash = "";
	//flag to stop while loop when condition is met shared over all threads
	bool flag = true;

	//if difficulty zero no hash should be calculated
	if (temp_hash.substr(0, difficulty) == str)
	{
		_hash = temp_hash;
		flag = false;
	}
	while (flag)
	{
		//paralise hash calculation
#pragma omp parallel for num_threads(thread::hardware_concurrency()) private(temp_hash) shared(flag)
		for (int i = initial; i < attempts; ++i)
		{
			temp_hash = calculate_hash(i);
			if (temp_hash.substr(0, difficulty) == str)
			{
				_hash = temp_hash;
				flag = false;
			}
		}
		attempts += increase;
		initial += increase;
	}

	auto end = system_clock::now();
	duration<double> diff = end - start;

	//write time to file
	*file << diff.count() << ",";
	cout << "Block mined: " << _hash << " in " << diff.count() << " seconds" << endl;
}

std::string block::calculate_hash(int nonce) const noexcept
{
	stringstream ss;
	ss << _index << _time << _data << nonce << prev_hash;
	return sha256(ss.str());
}

block_chain::block_chain()
{
	_chain.emplace_back(block(0, "Genesis Block"));
	_difficulty = 0;
}

void block_chain::add_block(block &&new_block) noexcept
{
	new_block.prev_hash = get_last_block().get_hash();
	new_block.mine_block(_difficulty, &file);
	_chain.push_back(new_block);
}