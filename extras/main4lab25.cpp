#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" double* power(double*, int);
extern "C" double dot(double*, double*,int);
//extern "C" double errornorm(double*, double*,int);
//extern "C" void scale(double*, int);

main()
{
  int i,j,k,n;
 
 
  double* myA;
  double* eigenvect;
  double* myreturn;
  double testreturn;
  
  
  
  cout<<"Please enter n: ";
  cin >> n;

  myA=(double*)malloc (8*n*n);
  eigenvect=(double*)malloc (8*n);
  cout<<"Please enter the array values, row upon row:"<<"\n";
 
  k=0;

  for (i=0; i<n; i++)
    for (j=0; j<n; j++)
      cin >> myA[k++];

//  cout << dot(myA, &myA[n], n);

//  cout << errornorm(myA, &myA[n], n);

/*  scale(myA, n);
    for (i=0; i<n; i++)
     cout << myA[i] << "\n";
*/
  
  
myreturn=power(myA, n);
for (i=0; i<n; i++)
  eigenvect[i]=myreturn[i];

cout << "\n";
for (i=0; i<n; i++)
  cout << eigenvect[i] << "\n";

cout << "\n" << dot(myA, eigenvect, n)/eigenvect[0] << "\n";

}
