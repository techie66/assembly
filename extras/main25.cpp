#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" double dogaussjordan(double*,int);


main()
{
  int i,j,n;
  double ar[4][5];

  n=4;

  for (i=0; i<n; i++)
    for (j=0; j<n+1; j++)
      cin >> ar[i][j];

 cout<<"\n"<<"Your input array:"<<"\n";

for (i=0; i<n; i++)
  {
   for (j=0; j<n+1; j++)
     cout << ar[i][j] << " ";
   cout << "\n";
  }

cout<<"\n"<<"The determinant is "<<dogaussjordan((double*)ar, n)<<"\n";

cout<<"\n"<<"The solution vector is shown below:"<<"\n";
for (i=0; i<n; i++)
 cout << ar[i][4] << "\n";
}
