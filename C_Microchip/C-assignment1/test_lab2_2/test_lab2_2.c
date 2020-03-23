//To take the whole words into the example1.txt and calculate each words.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>//Test the assignments.
int main(void)
{
	//Clarify each variables.
	FILE *fp=NULL;//For each file's operations.
	char str[2000];
    char *p = str;//Print out the wirting words.
    
	//Change the authorization of the file's operation.
	fp = fopen("E:\\大学资料\\C+Arduino\\exercise\\C-assignment1\\test_lab2_1\\example1.txt","r");
    while (!feof(fp))//Check the files' ending places.
    {
        *p++ = fgetc(fp);//Catch each words.
    }
    *--p = '\0';
    printf("%s\n",str);
    return 0;
}
