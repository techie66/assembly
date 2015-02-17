#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" double find_det(double*,int);

int MAX_SIZE = 10;

main()
{
  int i,j,n;
  double ar[10][10];

  cout << "Please input the dimension of your array: ";
  cin >> n;
  cout<<"Please enter the array values, row upon row:"<<"\n";
  
  i=0;

  for (i=0; i<n; i++)
    for (j=0; j<n; j++)
      cin >> ar[i][j];

cout<<"The determinant is "<<find_det((double*)ar, n)<<"\n";

cout<<"The array after your adjustments have been made:"<<"\n";

for (i=0; i<n; i++)
  {cout << "\n";
  for (j=0; j<n; j++)
    cout << ar[i][j] << " ";
  }

}
