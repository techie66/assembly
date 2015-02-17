#include <iostream>
#include <stdlib.h>
#include <math.h>
using namespace std;

extern "C" double integrand(float);
extern "C" double simpson(float, float, int, double(*p2fn)(float));
double xcubed(float);
double mylogx(float);

main()
{
  double integral;
  integral=simpson(0, 1, 10, xcubed);
    cout << integral << "\n";
  integral=simpson(1,(float)exp(1.), 10, mylogx);
    cout << integral << "\n";
  integral=simpson(0, 2*3.14159, 20, integrand);
    cout << integral << "\n";
}

double xcubed(float x)
 {return x*x*x;}
double mylogx(float x)
 {return 1/x;}
double integrand2(float x)
{ 
  //return x*x;
return sqrt(1+x*x/2);
}
