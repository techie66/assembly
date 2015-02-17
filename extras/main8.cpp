#include <iostream>
using namespace std; 

extern "C" int smallrand(void);
extern "C" void mysort(int*, int);
extern "C" int* binsearch(int*, int, int);
main()
{
  int my_array[100],i;
  int target;
  int* res;

  //populate the array with -100<=array_values<100
  for(i=0; i<100; i++)
    my_array[i] = smallrand();
  
  mysort(my_array, 100);
 
  //display sorted array
  for(i=0; i<100; i++)
    cout << my_array[i] << " ";
    //printf("%d ", my_array[i]);

  cout << "\n\nPlease input target value: ";
    //printf("\n\nPlease input target value: ");
  
  cin >> target;
    //scanf("%d", &target);
  
  res=binsearch(my_array, 100, target);
  if (res != NULL)
    cout << "target was found at index " << res-my_array << "\n";
      //printf("target was found at index %d\n", res-my_array);
  else
    cout << "target was not found\n";
      //printf("target was not found\n");
 
}


