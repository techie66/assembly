#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" void matrixmult(int*, int*, int, int*);

int N=3;

main ()
{
  int left[N][N], right[N][N], prod[N][N];
  int i, j, k;
  

  //initialize arrays with sample data
  k=0;
  for (i=0; i<N; i++)
     for (j=0; j<N; j++)
       left[i][j]=k++;

  k=1;
  for (i=0; i<N; i++)
    for (j=0; j<N; j++)
      right[i][j]=k++;

matrixmult((int*)left, (int*)right, N, (int*)prod);

//display final product matrix
  
  for (i=0; i<N; i++)
   {
    for (j=0; j<N; j++)
        cout << prod[i][j] << " ";
    cout << "\n";
   }

}




