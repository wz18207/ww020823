//To calculate two integer numbers.
#include <stdio.h>
#include <stdlib.h>
int main(void)
{
	//Two defined numbers.
	int num_a,num_b;
	printf("Please input two integer numbers:");
	scanf("%d,%d",&num_a,&num_b);
	//Output the calculation numbers.
	fprintf(stdout,"Sum=%d\n",num_a+num_b);
	fprintf(stdout,"Average=%d\n",(num_a+num_b)/2);
	fprintf(stdout,"Square=%d\n",num_a*num_b);
	return 0;
}
