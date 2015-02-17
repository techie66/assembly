#include <iostream>
#include <stdlib.h>
using namespace std; 

extern "C" int delstr(char*, int, char*, int);
extern "C" int insstr(char*, int, char*, int);

main()
{
  FILE* fileid;
  char myarray[500]; //allow room for possible insertions
  char myname[30];
  int i, oldlen, position;
  char* insaddr;
  char newline=10, resp;
  int len=349, namecount=20;

  fileid=fopen("names.txt","r");
  fread(myarray, 1, 349, fileid);
do
{
  cout << "Please enter name to delete: ";
  fgets(myname, 30, stdin); //retains newline character

  oldlen=len;
  len=delstr(myarray, len, myname, strlen(myname));
    cout << "\n";
    for(i=0; i<len; i++)
      cout << myarray[i];
    cout << "\n";
  if(oldlen != len) namecount--;

  printf("Enter new position for your name (1 thru %d): ",namecount+1);
  cin >> position;
  
  insaddr=myarray;
  for (i=0; i< position-1; i++)
     insaddr=strchr(insaddr, 10),insaddr++;
 
  len=insstr(insaddr, len-(insaddr-myarray), myname, strlen(myname));
  len=len+(insaddr-myarray);
  namecount++;

  cout << "\n";
  for(i=0; i<len; i++)
    cout << myarray[i];
  cout << "\n";

  cout << "another? (y or n)";
  //cin >> resp; does not work
  scanf("%*c%c%*c",&resp); //newline inherited and newline stranded
}
while(resp=='y');
}
