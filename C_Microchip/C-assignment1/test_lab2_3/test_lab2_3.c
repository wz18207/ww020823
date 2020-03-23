//To take the whole words into the example1.txt and calculate each words.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>//Test the assignments.
int main(void)
{
	//Clarify each variables.
	FILE *fp=NULL;//For each file's operations.
	int times[50];//Similarity words' time in reading files.
	char str[2000];
    char *p = str;//Print out the wirting words.
    char ch;//Calculate words' length parts.
	
	//Print out example1.txt words.
	//Change the authorization of the file's operation.
	fp=fopen("E:\\大学资料\\C+Arduino\\exercise\\C-assignment1\\test_lab2_1\\example1.txt","r");
    while (!feof(fp))//Check the files' ending places.
    {
        *p++ = fgetc(fp);//Catch each words.
    }
    *--p = '\0';
    printf("%s\n",str);
    
    //Calculation the lens of each words in example1.txt.
    //Restore the loaction of the fp variable.
    fp=fopen("E:\\大学资料\\C+Arduino\\exercise\\C-assignment1\\test_lab2_1\\example1.txt","r");//?None writing with the program broken.?
	memset(times,0,sizeof(int)*50);//Apply new memory in working.Without un-patching memory location.
	while((ch = fgetc(fp)) != EOF)
	{	
		int len = 0;//Calculation of the each words length.
		while(ch != ' ' && ch != EOF)//Invaid unlimited loop of this program. 
		{
			++len;
			ch = fgetc(fp);
		}
		++times[len];
	}
	//Calculating each length of the words.
	printf("Len\tTimes\n");//Tab;and print out the results.
	for(int i = 0;i<50;++i)
	{
		if(times[i] != 0)
		{
			printf("%d \t %d \n",i,times[i]);
		}
	}
	fclose(fp);
	return 0;
}
