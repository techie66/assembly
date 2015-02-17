#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" void mergsort(unsigned int [], int);

main()
{
  unsigned int numbers[1000000], i; 
  for(i=0; i<1000000; i++)
    numbers[i]=rand()<<1;

  mergsort(numbers, 1000000);

  for(i=0; i<100; i++)
    cout << numbers[i] << " ";
  cout << "\n";

  cout << ". . . . . . . . . . . . ." << "\n";

  for(i=999900; i<1000000; i++)
    cout << numbers[i] << " ";
  cout << "\n";  
  
}
  
