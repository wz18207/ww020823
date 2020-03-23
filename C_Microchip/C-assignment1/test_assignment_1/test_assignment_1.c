#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "assignment1.h"
int main(void)
{
	FILE* fp = NULL;
	FILE* f_p = NULL;
	char filename[100]; //Read the file name.
	char tempstr[1024];  //Buffer of the file's loading.
	char bank[] = " ";
	int i = 0, j = 0;
	int ifindPunct = 0;
	int ifind = 0;
	int iBeforfind = 0;
	int iAllNum = 1;
	printf("Please input the file name:");
	scanf("%s", filename); //scanf the file name. 
	f_p = fopen("assignment.txt", "w+");//Create the file and write the new file.
	if ((fp = fopen(filename, "r")) == NULL)//charge the file name in error.
	{
		printf("Error in opening %s.\n", filename);
		return 0;
	}
	//Print the file's information.
	while (fgets(tempstr, 1024, fp) != NULL)
	{
		char* p = strtok(tempstr, bank);//devide the char.
		while (p)//To fine the true point.
		{
			ifindPunct = 0;
			ifind = 0;
			for (i = 0; i < 32; i++)
			{
				char* word = *Keywords[i];
				int ip = strlen(p);
				int iword = strlen(word);
				if (ip >= iword)
				{
					ifind = 1;
					for (j = 0; j < ip; j++)
					{
						if (p[j] == word[j])
						{
							continue;
						}
						if (p[j] == '.' || p[j] == ',' || p[j] == '?' || p[j] == '!')
						{
							ifind = 1;
						}
						else
						{
							ifind = 0;
							break;
						}
					}
					if (ifind == 1)
					{
						break;
					}
				}
				for (j = 0; j < ip; j++)
				{
					if (p[j] == '.' || p[j] == ',' || p[j] == '?' || p[j] == '!')
					{
						ifindPunct = 1;
						break;
					}
				}
			}

			if (ifind == 1)
			{
				if (iBeforfind == 0)//In keywords parts.
				{
					iBeforfind = 1;
					iAllNum += 1;
					printf("\n%s\n", p);//print the keywords of the char.
					fprintf(f_p, "\n%s\n", p);
					iAllNum += 1;
				}
				else
				{
					printf("%s\n", p);//print the constant char.
					fprintf(f_p, "%s\n", p);
					iAllNum += 1;
				}
			}
			else
			{
				iBeforfind = 0;//In constant words.
				printf("%s ", p);//Print the constant char.
				fprintf(f_p, "%s ", p);
				if (ifindPunct == 1)//Devide the punctation into the different line.
				{
					printf("\n");
					fprintf(f_p, "\n");
					iAllNum += 1;
				}
			}

			p = strtok(NULL, bank); //Devide the string char.
		}
	}
	printf("Total number of lines is %d.", iAllNum);
	fprintf(f_p, "Total number of lines is %d.", iAllNum);
	fclose(fp);
}
