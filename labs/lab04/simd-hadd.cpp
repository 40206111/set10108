#include <iostream>
#include <immintrin.h>

using namespace std;

union v4
{
	__m128 v;
	float a[4];
};

int main(int argc, char **argv)
{
	alignas(16) v4 x;
	alignas(16) v4 y;
	alignas(16) v4 result;

	for (size_t i = 0; i < 4; ++i)
	{
		x.a[i] = static_cast<float>(i);
		y.a[i] = static_cast<float>(i + 4);
	}

	//x
	cout << "x: " << endl;
	for (size_t i = 0; i < 4; ++i)
		cout << x.a[i] << endl;

	//y
	cout << "y: " << endl;
	for (size_t i = 0; i < 4; ++i)
		cout << y.a[i] << endl;

	//x and y
	cout << "x and y: " << endl;
	result.v = _mm_hadd_ps(x.v, y.v);
	for (size_t i = 0; i < 4; ++i)
		cout << result.a[i] << endl;

	//x and y
	cout << "y and x: " << endl;
	result.v = _mm_hadd_ps(y.v, x.v);
	for (size_t i = 0; i < 4; ++i)
		cout << result.a[i] << endl;
	
	//x and x
	cout << "x and x: " << endl;
	result.v = _mm_hadd_ps(x.v, x.v);
	for (size_t i = 0; i < 4; ++i)
		cout << result.a[i] << endl;

	//x and x 2
	cout << "x and x 2: " << endl;
	result.v = _mm_hadd_ps(result.v, result.v);
	for (size_t i = 0; i < 4; ++i)
		cout << result.a[i] << endl;

	//y and y
	cout << "y and y: " << endl;
	result.v = _mm_hadd_ps(y.v, y.v);
	for (size_t i = 0; i < 4; ++i)
		cout << result.a[i] << endl;

	//y and y 2
	cout << "y and y 2: " << endl;
	result.v = _mm_hadd_ps(result.v, result.v);
	for (size_t i = 0; i < 4; ++i)
		cout << result.a[i] << endl;
}