//To let each demical number change into 10 demical numbers.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>//To support each mathematics calculation.
int oct2dec(char *o)//8 demical change into 10 demical.
{
    int r=0;
    while(*o)//use wage location to calculate.
    {
        r=r*8+(*o++ -'0');//find final mods.
    }
    return r;
}
int bin2dec(long long n)
{
  int bin2 = 0,i=0,remainder;//calculating 2 to 10 demical.
  while(n!=0)
  {
    remainder = n%10;  //find final mods.
    n /=10;    
    bin2 += remainder*pow(2,i); 
    ++i;
  }
  return bin2;
}
int main(void)
{
    char o[30]="77";
    long long int b=1111;
    printf("Base\tValue\tResult\tOptional Description\n");
    printf("10\t1234\t1234\t\n");
    printf("8\t%s\t%d\t(the value of 77 in base 8, octal)\n",o,oct2dec(o));
    printf("2\t%I64d\t%d\t(the value of 1111 in base 2, binary)\n",b,bin2dec(b));
    return 0;
}
