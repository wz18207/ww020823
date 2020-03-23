//To make a “example1.h” file and make everything in finding parts.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include "example1.h"
struct word
{
	char c[30];
	int n;
}
w[10000];
int main(void)
{
	FILE *fp=NULL;
	char b[30],ch;
	int i=0,m=1,j=0,k=0,flag=0;
    unsigned int cnt[2000]={0};//Statistic numbers of the words.
    unsigned int t;
    char str[2000];
    char *p = str;//Print out the wirting words.
    //char *ch_input_1="program",*ch_input_2="computer",*ch_input_3=".",*ch_input_4=",";
    //char *ch_output_1="program",*ch_output_2="computer",*ch_output_3=".",*ch_output_4=",";
    //printf("%s\t%s\t%s\t%s\t\n",ch_output_1,ch_output_2,ch_output_3,ch_output_4);
    //words(str);
    fp=fopen("E:\\大学资料\\C+Arduino\\exercise\\C-assignment1\\test_lab3_1\\example1.txt","r");
    //fp=fopen("E:\\大学资料\\C+Arduino\\exercise\\C-assignment1\\test_assigment1\\assignment1.txt","r");
    while((ch=fgetc(fp))!=EOF)
	{	 
		if('A'<=ch&&ch<='Z')
		{
			ch=ch+32;
		}
		if('a'<=ch && ch<='z')
		{
			b[i]=ch;
			i++;
			flag=1;
		}
		else
		{
			if((ch=fgetc(fp))=='\n')
			{
				flag=0;
			}
			else
			{
				if(flag==1)
				{
					b[i]='\0';
					i=0;
					flag=0;
					m=0;
					for(j=0;j<k;j++)
					{
						if(strcmp(b,w[j].c)==0)
						{
							m=1;
							break;
						}//Out of the loop.
					}
					if(m) 
					{
						w[j].n++;
					}
					else
					{
						w[k].n=1;
						strcpy(w[k].c,b);
						k++;
					}
				}
			}

			if('A'<=ch && ch<='Z') 
			{
				ch+=32;
			}
			if('a'<=ch && ch<='z')
			{
				b[i]=ch;
				i++;
				flag=1;
			}
		}
	}
	printf("%d\n",k);//Kinds number of the constants.
	///
	for(i=0;i<k;i++) 
	{
		if(w[i].c)
		{
		printf("%s:%d\n",w[i].c,w[i].n);
		}
	}
	fclose(fp);
	printf("\n");
	fp=fopen("E:\\大学资料\\C+Arduino\\exercise\\C-assignment1\\test_lab2\\example1.txt","r");
    while(!feof(fp))//Check the files' ending places.
    {
        *p++ = fgetc(fp);//Catch each words.
    }
    *--p = '\0';
    for(t=0;str[t]!='\0';++t)
    {
        cnt[str[t]]++;
	}
    for(t=0;t<strlen(str);t++)
    {
        if(cnt[t]!=0)
        {
			printf("%c:%d\n",t,cnt[t]);
		}
	}
	fclose(fp);
	printf("\n");
	for(i=0;i<k;i++) 
	{
		if(strcmp(w[i].c,"program")==0)
		{
			printf("%s:%d\n",w[i].c,w[i].n);
		}
		if(strcmp(w[i].c,"computer")==0)
		{
			printf("%s:%d\n",w[i].c,w[i].n);
		}
	}
	for(t=0;t<strlen(str);t++)
    {
        if(cnt[t]!=0)
        {
			if(cnt[t]==6)
			{
				printf("%c:%d\n",t,cnt[t]);
			}
			if(cnt[t]==7)
			{
				printf("%c:%d\n",t,cnt[t]);
			}
		}
	}
    return 0;
}
