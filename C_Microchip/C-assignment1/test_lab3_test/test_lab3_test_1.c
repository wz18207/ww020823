#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "example1.h"
int main(void)
{
	FILE *fp;//opening the file.
	char ch_input;
	char *p = str;//Print out the wirting words.
    char ch;//Calculate words' length parts.
	int n = 0;
	printf("Please input the word you want to find in the file:");
	scanf("%s",ch_input);
	fp=fopen("E:\\大学资料\\C+Arduino\\exercise\\C-assignment1\\test_lab2\\example1.txt","r");
	while (!feof(fp))//Check the files' ending places.
    {
        *p++ = fgetc(fp);//Catch each words.
    }
    *--p = '\0';
    printf("%s\n",str);
	num(ch_input,str,&n);
	printf("%d",n);
	system("pause");
}
