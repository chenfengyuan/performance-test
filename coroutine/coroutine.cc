#include <boost/coroutine/all.hpp>
#include <iostream>
#include <vector>

typedef boost::coroutines::coroutine< void() > coro_t;

void fn( coro_t::caller_type & ca)
{
	std::vector<int> arr;
	for(int i=0;i<100000000;++i){
		arr.push_back(i);
	}
	while(1){
		ca();
	}
}

int main( int argc, char * argv[])
{
    coro_t c1(fn);
    coro_t c2(fn);
    int total = 50000000;
    for(int i = 0;i < total ;++i ){
    	c1();
    	c2();
    }
    return EXIT_SUCCESS;
}
