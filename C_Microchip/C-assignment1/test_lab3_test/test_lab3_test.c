#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
int main(void)
{
	FILE *fp;
	char ch_input[2000];
	char ch_output[2000];
	//char str[2000];
    //char *p = str;//Print out the wirting words.
	
	fp=fopen("E:\\大学资料\\C+Arduino\\exercise\\C-assignment1\\test_lab2\\example1.txt","r");
	printf("Please input the words you want to find:");
	//scanf("%s",ch_input);
	if(fp==NULL)
	{
		printf("Target file has no words.\n");
		return -1;
	}
	scanf("%s",ch_input);
	while(fgets(ch_output,sizeof(ch_output),fp))
	{
		if(strstr(ch_output,ch_input))
		{
			printf("%s in %s",ch_input,ch_output);
			fclose(fp);
			return 0;
		}
	}
	printf("Not found str:%s\n",ch_input);
	return -1;
}
