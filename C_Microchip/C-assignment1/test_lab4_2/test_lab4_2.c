//To calculation the sum of the files.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(void)
{
	float price_input,profit,sum,rate;
	int i=0;
	
	printf("Please input the price you want to input:");
	scanf("%f",&price_input);
	printf("Please input the rate you want:");
	scanf("%f",&rate);
	printf("Please input the year you want:");
	scanf("%d",&i);
	printf("Original sum %2f at %2f percent for %d years\n",price_input,rate,i);
	printf("Year\tInterest\tSum\t\n");
	for(int j=0;j<i;j++)
	{
		profit=(price_input)*(rate/100);
		sum=profit+price_input;
		printf("%d\t%2f\t%2f\t\n",j,profit,sum);
		price_input=sum;
	}
	return 0;
}
		
