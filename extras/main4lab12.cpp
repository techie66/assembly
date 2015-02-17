#include <iostream>
#include <stdlib.h>
using namespace std; 


extern "C" void reorder(char* [], int);

main ()
{
  char name1[] = "Grimes, Dustin L.";
  char name2[] = "Her Many Horses, Shawn L.";
  char name3[] = "Lojek, Anthony E.";
  char name4[] = "Merchant, Benjamin D.";
  char name5[] = "Midzak, Joseph A.";
  char name6[] = "Bertsch, Kristopher A.";
  char name7[] = "Bishop, Nathan J.";
  char name8[] = "Christensen, Felicia M.";
  char name9[] = "Dadah, Paul B.";
  char name10[] = "Grajkowske, Adam T.";
  char name11[] = "Kalt, Jeremy T.";
  char name12[] = "Lockwood, Chad A.";
  char name13[] = "Malsam, Steve A.";
  char name14[] = "Norton, Parker A.";
  char name15[] = "Poe, Christopher A.";
  char name16[] = "Schumacher, Timothy W.";
  char name17[] = "TeBeest, Bryce J.";
  char name18[] = "Williams, Joseph L.";

  char* names[18];
  int i;

  
  
  names[0] = name1;
  names[1] = name2;
  names[2] = name3;
  names[3] = name4;
  names[4] = name5;
  names[5] = name6;
  names[6] = name7;
  names[7] = name8;
  names[8] = name9;
  names[9] = name10;
  names[10] = name11;
  names[11] = name12;
  names[12] = name13;
  names[13] = name14;
  names[14] = name15;
  names[15] = name16;
  names[16] = name17;
  names[17] = name18;

  reorder (names, 18);

  //display final result

   for (i=0; i<18; i++)
    cout << names[i] << "\n";

  cout << "\n";
}

