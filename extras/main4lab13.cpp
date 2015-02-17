#include <iostream>
#include <stdio.h>

using namespace std;

extern "C" int find_and_replace(char*, int, char*, int, char*, int);

main()
{
  char original[81], lookfor[81], replacewith[81];
  int length1, length2, length3, p;

  cout << "Please enter original string: ";
  scanf("%80[^\n]%n", original, &length1);
  //cout << original <<  " " << length1 << "\n";
    

 cout << "Please enter potential substring: ";
  scanf("\n");
  scanf("%80[^\n]%n", lookfor, &length2);
 //cout << lookfor <<  " " << length2 << "\n";

  cout << "Please enter replacement string: ";
  scanf("\n");
  scanf("%80[^\n]%n", replacewith, &length3);  
  //cout << replacewith <<  " " << length3 << "\n";

  p=find_and_replace(original, length1, lookfor,length2, replacewith, length3);

  if (p==-1) cout << "match not found" << "\n";
  else
  {
  cout << "\n" << "The new string is: " << original << "\n";
  cout << "The length of new string is " << p << "\n";
  }

}
