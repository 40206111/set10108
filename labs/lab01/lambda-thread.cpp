#include <thread>
#include <iostream>

using namespace std;

int main(int argc, char **argv)
{
    // Create a thread using a lambda expression
    thread t([]{ cout << "Hello from lambda thread! from thread: " << this_thread::get_id() << endl; });
    // Join thread
    t.join();

    return 0;
}