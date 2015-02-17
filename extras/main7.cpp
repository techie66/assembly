#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" void matrixmult(int [][4], int [][4], int [][4]);

main ()
{
  int left[4][4], right[4][4], prod[4][4];
  int i, j, k;

  //initialize arrays with sample data
  k=-3;
  for (i=0; i<4; i++)
     for (j=0; j<4; j++)
       left[i][j]=k++;

  k=-1;
  for (i=0; i<4; i++)
    for (j=0; j<4; j++)
      right[i][j]=k++;

  matrixmult(left, right, prod);

//display final product matrix
  cout << "\n" << "Matrix A multiplied by Matrix B is" << "\n";
  for (i=0; i<4; i++)
   {
    for (j=0; j<4; j++)
        cout << prod[i][j] << " ";
    cout << "\n";
   }

matrixmult(right, left, prod);

//display final product matrix
  cout << "\n" << "Matrix B multiplied by Matrix A is" << "\n";
  for (i=0; i<4; i++)
   {
    for (j=0; j<4; j++)
        cout << prod[i][j] << " ";
    cout << "\n";
   }
  cout << "\n" << "Can that be right?" << "\n" << "\n";
}




