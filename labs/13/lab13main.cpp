#include <iostream>
#include <stdio.h>
using namespace std;

extern "C" void matrixmult(int [][4], int [][4], int [][4]);

main ()
{
  int left[4][4], middle[4][4], right[4][4], product[4][4];
  int i, j, k;

  //initialize arrays with sample data
  k=0;
  for (i=0; i<4; i++)
    for (j=0; j<4; j++)
      left[i][j]=k++;

  k=1;
  for (i=0; i<4; i++)
    for (j=0; j<4; j++)
      middle[i][j]=k++;

  k=2;
  for (i=0; i<4; i++)
    for (j=0; j<4; j++)
      right[i][j]=k++;

  matrixmult(left, middle, product);

  matrixmult(product, right, left);

  for (i=0; i<4; i++)
   {
    for (j=0; j<4; j++)
        cout << left[i][j] << " ";
    cout << "\n";
   }
}
