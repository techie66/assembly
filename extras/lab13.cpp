#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" void transpose(int* [], int);
extern "C" void show_array(int* [], int);

main()
{
  int i, j, N;
  int **rowaddresses, **rowaddresses2;

  cout << "Please enter the value of N: ";
  cin >> N;
  rowaddresses = (int**)malloc(N*sizeof(int));
  rowaddresses2 = (int**)malloc(N*sizeof(int));

  for (i=0; i<N; i++)
    { rowaddresses[i] = (int*) malloc(N*sizeof(int));
      for (j=0; j<N; j++)
        scanf("%d", rowaddresses[i]+j);
    }

  transpose(rowaddresses, N);
  
  show_array(rowaddresses, N);

}
      
