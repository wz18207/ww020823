#include <stdio.h>
 int main(void)
{   
     long  int n;
     int x1,x2,x3,x4,x5,x6,x7,x8;
     scanf("%ld",&n);
     x1=n/10000000;
     if (x1!=0)
     printf("%d ",x1);
     x2=(n-x1*10000000)/1000000;
     if (x2!=0)
     printf("%d ",x2);
     x3=(n-x1*10000000-x2*1000000)/100000;
     if (x3!=0)
     printf("%d ",x3);
     x4=(n-x1*10000000-x2*1000000-x3*100000)/10000;
     if (x4!=0)
     printf("%d ",x4);
     x5=(n-x1*10000000-x2*1000000-x3*100000-x4*10000)/1000;
     if (x5!=0)
     printf("%d ",x5);
     x6=(n-x1*10000000-x2*1000000-x3*100000-x4*10000-x5*1000)/100;
     if (x6!=0)
     printf("%d ",x6);
     x7=(n-x1*10000000-x2*1000000-x3*100000-x4*10000-x5*1000-x6*100)/10;
     if (x7!=0)
     printf("%d ",x7);
     x8=n-x1*10000000-x2*1000000-x3*100000-x4*10000-x5*1000-x6*100-x7*10;
     printf("%d \n",x8);
      return 0;
}
