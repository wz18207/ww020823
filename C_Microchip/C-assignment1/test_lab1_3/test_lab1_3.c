//To change the second time into the standard time.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(void)
{
    int t_sec;
    printf("Please input the whole second of the time:");
    //Catch the location of main memory.
    while(scanf("%d",&t_sec)!=EOF)
    {
        printf("%d seconds is equivalent to %02d hours %02d minutes %02d seconds\n",t_sec,t_sec/3600,t_sec%3600/60,t_sec%60);
        //Off the loop.
        return 0;
    }
}
