#include <stdio.h>
#include <string.h>
#include <stdlib.h> 
struct stu
{
	int num[10];
	char str[11];
	int quantity[10];
}stu[200];
int read_line(char str[], int n) {
    int ch, j = 0;
    while((ch = getchar()) != '\n')
        if (j < n)
            str[j++] = ch;
    str[j] =  '\0';
    return j;
}
int main(void)
{
	int sn, j, cn, number,N=0;
	char code;
	while(1){
		printf("Enter operation code:\n");
		scanf("%s", &code);
	
	switch(code){
		case 'i':{
			printf("Enter part number: \n");
			scanf("%d", stu[N].num);
			printf("Enter part name: \n");
			int ch, j = 0;
    		while((ch = getchar()) != '\n')
        	if (j<10)
            stu[j].str == ch;
            j++;
			printf("Enter quantity on hand: \n");
			scanf("%d", stu[N].quantity);	
		break;
		}
		case 's':{
			printf("Enter part number: \n");
			scanf("%d", &sn);
			for(j=0;j<10;j++){
				if(stu[j].num == sn){
				printf("Part name: \n", stu[j].str);
				printf("Quantity on hand: \n", stu[j].quantity);
				break;
				}
			}
			if(j==10)
			printf("Part not found.\n");
			break;
		}
		case 'u':{
			printf("Enter part number:\n");
			scanf("%d", &sn);
			for(j=0;j<10;j++){
				if(stu[j].num == sn){
				printf("Enter change in quantity on hand: \n");
				scanf("%d", &cn);
				stu[j].quantity[j] += cn;
				break;
				}
			}
			if(j==10)
			printf("Part not found.\n");
			
			break;
		}
		case 'p':{
			printf("Part Number Part Name  Quantity on Hand\n");
			for(j=0;j<10;j++)
			printf("   %d   , %s ,  %d ",stu[j].num , stu[j].str ,stu[j].quantity); 
			break;
		}
		case 'q':{
			printf("QUIT\n");
			return 0;
			break;
		}
		default: printf("error message\n");
	}
	N++;
 	}
 	return 0;
}

