
%µÚÒ»×éºì

clc,clear
score1 = xlsread('data1.xls',1,'D2:M271');
N=27;
SwineNum1 = xlsread('data1.xls',1,'N2:N271');
SwineNum1(isnan(SwineNum1))=[];
SumScore=zeros(N,10);
for i = 1:N
    for j = 1:10
       for k = 1:10
       SumScore(i,j) = SumScore(i,j)+score1((i-1)*10+k,j);
       end
    end
end
SumScore=SumScore';
STD1 = sum(std(SumScore))/N

score1 = xlsread('data1.xls',2,'D2:M271');
N=27;
SwineNum1 = xlsread('data1.xls',2,'N2:N271');
SwineNum1(isnan(SwineNum1))=[];
SumScore=zeros(N,10);
for i = 1:N
    for j = 1:10
       for k = 1:10
       SumScore(i,j) = SumScore(i,j)+score1((i-1)*10+k,j);
       end
    end
end
SumScore=SumScore';
STD2 = sum(std(SumScore))/N

score1 = xlsread('data1.xls',3,'D2:M281');
N=28;
SwineNum1 = xlsread('data1.xls',3,'N2:N281');
SwineNum1(isnan(SwineNum1))=[];
SumScore=zeros(N,10);
for i = 1:N
    for j = 1:10
       for k = 1:10
       SumScore(i,j) = SumScore(i,j)+score1((i-1)*10+k,j);
       end
    end
end
SumScore=SumScore';
STD3 = sum(std(SumScore))/N

score1 = xlsread('data1.xls',4,'D2:M281');
N=28;
SwineNum1 = xlsread('data1.xls',4,'N2:N281');
SwineNum1(isnan(SwineNum1))=[];
SumScore=zeros(N,10);
for i = 1:N
    for j = 1:10
       for k = 1:10
       SumScore(i,j) = SumScore(i,j)+score1((i-1)*10+k,j);
       end
    end
end
SumScore=SumScore';
STD4 = sum(std(SumScore))/N


