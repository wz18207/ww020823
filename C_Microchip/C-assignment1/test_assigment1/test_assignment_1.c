//To analyze the information of the txt.
//To find the file and calculation the total_sentions in this file.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Consttype.h"
int main(void)
{
    int c,l=0;
    int i,n=0;
	char a[2000][25]={0};
	char b[2000][25]={0};
	char k[2000][25]={0};
    //char ch_fl[200];
    //printf("Please input the file name:");
    //scanf("%s",ch_fl);
    //FILE *fp = fopen(ch_fl,"r");
    FILE *fp=fopen("assignment1.txt","r");
    while((c = fgetc(fp)) != EOF)
	{	
		fscanf(fp,"%s",a[n]);
		n++;
		for(i=0;i<n;i++)
		{
			for(int j=0;j<(sizeof(keywords)/sizeof(keywords[0]));j++)
			{
				if(a[i]!=keywords[j])
				{
					b[i]=a[i];
				}
				else if(c=='.'||c==','||c=='!'||c=='?'||a[i]==keywords[j])
				{
					k[i]=a[i];
					l++;
					j++;
				}
		//if a[n] in const
		//printf(......\n);
		//else
		//printf(.......);
			}
			i++;
		}
		printf("%s ",b[i]);
		printf("%s\n",k[i]);
	}
	l++;
	//for(int j=0;j<(sizeof(keywords)/sizeof(keywords[0]));j++)
	//
	//	{printf("%s ",keywords[j]);}
	//
    printf("\nTotal number of lines is:%d\n",l);
	fclose(fp);
	//fp = fopen(ch_fl,"r");
}
