#include <iostream>
#include <stdlib.h>
using namespace std;

extern "C" char* sum(unsigned*, int);

main()
{
  unsigned my_array[1000000];
  int i;
  char* sumstring;
  
  for(i=0; i<1000000; i++)
    my_array[i]=rand();

  sumstring=sum(my_array, 1000000);

  cout << "\n" << sumstring << "\n";
}
