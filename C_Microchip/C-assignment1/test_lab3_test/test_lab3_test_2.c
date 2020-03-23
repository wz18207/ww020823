#include<stdio.h>
#include<string.h>
struct word
{
	char c[30];
	int n;
}
w[10000];
int main(void)
{
	FILE *fp;
	//int t;
	char b[30],ch,ch_input;
	int i=0,m=1,j=0,k=0,flag=0;
	printf("Please input the words you want to find:");
	scanf("%s",&ch_input);
	fp=fopen("E:\\大学资料\\C+Arduino\\exercise\\C-assignment1\\test_lab2\\example1.txt","r");
	while((ch=fgetc(fp))!=EOF)
	{ 
		if('A'<=ch&&ch<='Z')
		{
			ch=ch+32;
		}
		if('a'<=ch && ch<='z')
		{
			b[i]=ch;i++;flag=1;
		}
		else
		{
			if(ch=='-'&&(ch=fgetc(fp))=='\n')
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
						}
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
	 printf("%d\n",k);
	for(i=0;i<k;i++) 
	{
		printf("%s\t%d\n",w[i].c,w[i].n);
	}
	printf("\n");
	for(i=0;i<k;i++)
	{
		if(ch_input==w[i].c)
		{
			
			printf("%s\t%d\n",w[i].c,w[i].n);
		}
		else
		{
			printf("There is no such word in this text.\n");
		}
	}
//	for(i=0;i<k&&i<200;i++) //统计前一百个
//	{
//		t=0;
//		while(w[t].n==0) 
//		{
//			t++;
//		}
//		for(j=1;j<k;j++)
//		{
//			if(w[j].n>w[t].n) 
//			{
//				t=j;
//			}
//			else
//			{	
//				if(w[j].n==w[t].n)
//				{
//					if(strcmp(w[j].c,w[t].c)<0)
//						t=j;
//				}
//			}
//		}
//		printf("%s\t%d\n",w[t].c,w[t].n);
//		w[t].n=0;
//	}
//	printf("")
	return 0;
}

