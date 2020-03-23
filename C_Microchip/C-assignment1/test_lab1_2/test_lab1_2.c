//To calculate the timestamp equalivations.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
int main(void)
{
	//To catch the system timestamp.
	time_t t;
	struct tm * lt;    
	time(&t);//Taking time from Unix.    
	lt=localtime(&t);//Change the structure of the timestamp.
	printf("%d/%d/%d %d:%d:%d\n",lt->tm_year+1900,lt->tm_mon,lt->tm_mday,lt->tm_hour,lt->tm_min,lt->tm_sec);//Results.
	
	return 0;
}
