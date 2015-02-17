#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" long long int bigsum(int*, int);
extern "C" char* bin64toasc(long long int);

main()
{
  int myarray[2000], value, i;
  long long int mysum;
  char *myptr, digits1[20], digits2[20];

  value=-1000000;
  for(i=0; i<2000; i++)
    {myarray[i]=value;
     value=value-1000000;
    }

  mysum=bigsum(myarray, 2000);
  myptr=bin64toasc(abs(mysum));
  if(mysum<0) 
    digits1[0]='-';
  else
    digits1[0]='+';
  strcpy(digits1+1, myptr);

  for(i=0; i<2000; i++)
    myarray[i]=1999999999;

  mysum=bigsum(myarray, 2000);
  myptr=bin64toasc(abs(mysum));
  if(mysum<0) 
    digits2[0]='-';
  else
    digits2[0]='+';
  strcpy(digits2+1, myptr);
  
  cout << digits1 << '\n';
  cout << digits2 << '\n';
}
