//To take the long words into a *.txt files.
//In order to use the functions of operating file system in Unix cilent.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(void)
{
	//Taking variable into the file.
	//char sent_file[2000];//Reading the English text and take it down.
	FILE *fp=NULL;
	
	//Create the new file.
	fp=fopen("E:\\大学资料\\C+Arduino\\exercise\\C-assignment1\\test_lab2_1\\example1.txt","w+");
	printf("Please input the words which been written into file:\n");
	while(1)//Notice:Press the " " part in scanf("[^\n]") without scanf("%s").
	{
		char c=getchar();
		if(c=='\n') break;
		//Creating the new file & taking the words into the new file.
		fprintf(fp,"%c",c);//Testing the parts.
	}
	fclose(fp);
}
