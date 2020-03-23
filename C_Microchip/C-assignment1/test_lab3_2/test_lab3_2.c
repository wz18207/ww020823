//To let each 10-bit number changable into 2-16 demical-parts.
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
//In calculating library of "math.h"
#include<math.h>
#define ll long long//Defend split out.
char lib_var[] ="0123456789ABCDEF";//2-16 demical library getting number from shuzi matrix.
int main(void)
{
    int n,m,i,j,k=0;//n:eachdemical;m:input number(10 demical);i:target demical;j:element of the results.
    char s[50];//Including every elements.
    printf("Please input the int number:");
    scanf("%d",&n);
    memset(s,0,sizeof(s));
    printf("Base\tValue\tResult\tOptional Description\n");
    for(i = 2; i <= 16; i++)
    {
		printf("%d\t%d\t",n,i);
        m=n;
        while(m!=0)
        {
            s[k++]=lib_var[m%i];//mod calculation and get final-last number.
            m/=i;//init m.
        }
        for(j=k; j>=0; j--)
		{
            printf("%c",s[j]);//Let the results in the same line with the printf results line.
        }
        printf("\tthe value of %d in base 10,change to %d demical.\n",n,i);
        memset(s,0,sizeof(s));
        k=0;
    }
    return 0;
}
