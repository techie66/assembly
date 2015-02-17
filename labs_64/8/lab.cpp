#include <cstdlib>
#include <iostream>

extern "C" void sort_yall(int*, int);
int main()
{
	int arr[1000000],i;

	for (i=0;i<1000000;i++)
	{
		arr[i] = rand() << 1;
	}


	sort_yall(arr,1000000);
	for(i=0;i<100;i++)
		std::cout << arr[i] << " : ";

	for (i=999900;i<1000000;i++)
		std::cout << arr[i] << " : ";

	return 0;
}
