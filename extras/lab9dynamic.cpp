#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" void matrixmult(int*, int*, int, int*);

main ()
{
  int N;
  int **leftrows, **rightrows, **prodrows;
  int i, j, k;
  int* leftvalues, *rightvalues, *prodvalues;
  
  
  cout << "Please enter the dimension of your NxN arrays: ";
  cin >> N;
  leftrows= (int**)malloc(sizeof(int)*N);
  leftvalues=(int*)malloc(sizeof(int)*N*N);

  rightrows= (int**)malloc(sizeof(int)*N);
  rightvalues=(int*)malloc(sizeof(int)*N*N);


  prodrows= (int**)malloc(sizeof(int)*N);
  prodvalues=(int*)malloc(sizeof(int)*N*N);
  

  //initialize row pointers

  for (i=0; i<N; i++)
     leftrows[i]=leftvalues+i*N;

  k=0;
  for (i=0; i<N; i++)
    for (j=0; j<N; j++)
      leftrows[i][j]=k++;

  for (i=0; i<N; i++)
     rightrows[i]=rightvalues+i*N;

  k=1;
  for (i=0; i<N; i++)
    for (j=0; j<N; j++)
      rightrows[i][j]=k++;

  for (i=0; i<N; i++)
     prodrows[i]=prodvalues+i*N;


matrixmult(leftvalues, rightvalues, N, prodvalues);

//display final product matrix
  
  for (i=0; i<N; i++)
   {
    for (j=0; j<N; j++)
        cout << leftrows[i][j] << " ";
    cout << "\n";
   }

for (i=0; i<N; i++)
   {
    for (j=0; j<N; j++)
        cout << prodrows[i][j] << " ";
    cout << "\n";
   }


}




