#ifndef __EXAMPLE1_H__
#define __EXAMPLE1_H__
//Taking finding parts in the *.h files.
//Create the read_structure.
void num(char *p, char *p2, int *n)
{
	char *temp;    //临时指针用来做判断
	int k = strlen(p);//算出字符串Str的长度;也就是strinp的长度；
	c=getchar(p2);
	if(c=='\n') break;
	while(1)   //如果到了那个比较长的字符串的末尾跳出循环
	{
		temp =strstr(p2, p);
		if(temp!= NULL)  //判断字符串STROUT。里面是否存在str  没有存放的话就等于null下面就直接跳出循环
		{
			(*n)++;     //调入进来的n++;
			p2 = p2 + strlen(p); 
			continue;
		}
		else
		{
			break;
		}
	}
}
#endif	__EXAMPLE1_H__
