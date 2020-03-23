//To read and locate the file's string.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Consttype.h"
int main(void)
{
	FILE *fp;
	char f_space[50]={'\0'};
	char a[2000][25]={0};
	//char buffer_1;
	int l,n=0;
	int flag;
	fp=fopen("assignment1.txt","r");
	//c = fgetc(fp);
	char *res;
	
	while(!feof(fp))
	{
		fscanf(fp,"%s",a[n]);//a:each words of this file.
		printf("%s",a[n]);
		for(int j=0;j<(sizeof(keyWords)/sizeof(keyWords[0]));j++)
		{
			//res = memchr(str, str2[0], strlen(str));
			res=memchr((a[n]+f_space),keyWords[j],strlen(a[n]+f_space));
			if(memchr(res==NULL))
			{
				flag=1;
				l+=flag;
				continue;
			}
			printf("\n%s",a[n]);
		}
		for(int j=0;j<(sizeof(keywords)/sizeof(keywords[0]));j++)
		{
			if(a[n]==keywords[j])
			{
				flag=1;
				l+=flag;
				continue;
			}
			printf("\n%s",a[n]);
		}
		n++;
	}
	printf("\nTotal number of lines is:%d\n",l);
	return 0;
}
