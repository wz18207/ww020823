//To find the file and calculation the total_sentions in this file.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(void)
{
    int c,l=0;
    char ch_fl[200];
    printf("Please input the file name:");
    scanf("%s",ch_fl);
    FILE *fp = fopen(ch_fl,"r");
    while((c = fgetc(fp)) != EOF)
    {
		if(c == '.') 
		{
			l++;
		}
	}
    l++;
    printf("Total number of lines is:%d\n",l);
    return 0;
}
