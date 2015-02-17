#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" int** transpose(int* [], int);
extern "C" void show_array(int* [], int);

main()
{
  int i, j, N;
  int **rowaddresses, **rowaddresses2;

  cout << "Please enter the value of N: ";
  cin >> N;
  cout << "Please enter "<<N<<" rows, "<<N<<" values per row:"<<"\n";
  rowaddresses = (int**)malloc(N*sizeof(int));

  for (i=0; i<N; i++)
    { rowaddresses[i] = (int*) malloc(N*sizeof(int));
      for (j=0; j<N; j++)
        scanf("%d", *(rowaddresses+i)+j);
    }

  rowaddresses2 = transpose(rowaddresses, N);
  
  cout << "\n"<<"The transpose is"<<"\n";
  show_array(rowaddresses2, N);

  cout << "Traditional C/C++ 2d-array syntax myarr[i][j] works here;";
  cout << "\ne.g., (assuming N>2), transposearray[1][2] displays as ";
  cout << rowaddresses2[1][2] << "\n";

}
      
