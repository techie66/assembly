#include <iostream>
#include <stdlib.h>
using namespace std; 

typedef int Transform[4][4];
extern "C" Transform* matrixmult(Transform, Transform);


main ()
{
  Transform left, middle, right, prod, *returned_ptr;
  int i, j, k;
  

  //initialize arrays with sample data
  k=-1;
  for (i=0; i<4; i++)
     for (j=0; j<4; j++)
       left[i][j]=k++;
  cout << "This is the left matrix:" << "\n";
//display the left matrix
  for (i=0; i<4; i++)
   {
    for (j=0; j<4; j++)
        cout << left[i][j] << " ";
    cout << "\n";
   }
   

  k=0;
  for (i=0; i<4; i++)
    for (j=0; j<4; j++)
      middle[i][j]=k++;
  cout << "This is the middle matrix:" << "\n";
//display the middle matrix
  for (i=0; i<4; i++)
   {
    for (j=0; j<4; j++)
        cout << middle[i][j] << " ";
    cout << "\n";
   }
   

   k=1;
   for (i=0; i<4; i++)
     for (j=0; j<4; j++)
       right[i][j]=k++;
  cout << "This is the right matrix:" << "\n";
//display right matrix
  for (i=0; i<4; i++)
   {
    for (j=0; j<4; j++)
        cout << right[i][j] << " ";
    cout << "\n";
   }
  

returned_ptr=matrixmult(left, middle);

//copy array values to their permanent home
for (i=0; i<4; i++)
    for (j=0; j<4; j++)
        prod[i][j] = (*returned_ptr)[i][j];
  cout << "This is the left-middle product:" << "\n";  
//display first product matrix
  for (i=0; i<4; i++)
   {
    for (j=0; j<4; j++)
        cout << prod[i][j] << " ";
    cout << "\n";
   }
   

returned_ptr=matrixmult(prod, right);
  cout << "This is the left-middle-right product:" << "\n";
//display final product matrix
  for (i=0; i<4; i++)
   {
    for (j=0; j<4; j++)
        cout << (*returned_ptr)[i][j] << " ";
    cout << "\n";
   }

}
