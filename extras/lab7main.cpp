#include <iostream>
using namespace std; 

extern "C" void fill_array(signed char*, int);
extern "C" void sort_array(signed char*, int);
extern "C" int binsearch(signed char*, int, signed char);
main()
{
  signed char my_array[100];
  signed char target;
  int numin, res, i;

  fill_array(my_array, 100);
  
  sort_array(my_array, 100);
 
  for(i=0; i<100; i++)
    cout << (int)my_array[i] << " ";
    //printf("%d ", my_array[i]);

  cout << "\n\nPlease input target value: ";
    //printf("\n\nPlease input target value: ");
  
  cin >> numin;
    //scanf("%d", &numin);
  target = (signed char) numin;
  
  

  res=binsearch(my_array, 100, target);
  if (res != -1)
    cout << "target was found at index " << res << "\n";
      //printf("target was found at index %d\n", res);
  else
    cout << "target was not found\n";
      //printf("target was not found\n");
 
}


