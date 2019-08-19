
%******************************************************
%问题1：求两个组各个样酒的总分及平均标准差
%并将其写入'问题1葡萄酒评分表.xls'的第5个工作表中
%******************************************************

%第一组（红）各个样酒的总分
clc,clear
score = xlsread('问题1葡萄酒评分表.xls',1,'D2:M271');
N=27;
SwineNum = xlsread('问题1葡萄酒评分表.xls',1,'N2:N271');
SwineNum(isnan(SwineNum))=[];
Sumscore = zeros(27,1);
Sumscore0 = zeros(27,1);
for i = 1:N
    for j = 1:10
       Sumscore(i) = Sumscore(i)+sum(score((i-1)*10+j,:));
    end
    Sumscore(i)=Sumscore(i)/10;
end
for i=1:N
    Sumscore0(SwineNum(i))=Sumscore(i);
end
xlswrite('问题1葡萄酒评分表.xls',Sumscore0,5,'B2:B28');

%第二组（红）各个样酒的总分
clc,clear
score = xlsread('问题1葡萄酒评分表.xls',2,'D2:M271');
N=27;
SwineNum = xlsread('问题1葡萄酒评分表.xls',2,'N2:N271');
SwineNum(isnan(SwineNum))=[];
Sumscore = zeros(27,1);
Sumscore0 = zeros(27,1);
for i = 1:N
    for j = 1:10
       Sumscore(i) = Sumscore(i)+sum(score((i-1)*10+j,:));
    end
    Sumscore(i)=Sumscore(i)/10;
end
for i=1:N
    Sumscore0(SwineNum(i))=Sumscore(i);
end
xlswrite('问题1葡萄酒评分表.xls',Sumscore0,5,'C2:C28');

%第一组（白）各个样酒的总分
clc,clear
score = xlsread('问题1葡萄酒评分表.xls',3,'D2:M281');
N=28;
SwineNum = xlsread('问题1葡萄酒评分表.xls',3,'N2:N281');
SwineNum(isnan(SwineNum))=[];
Sumscore = zeros(N,1);
Sumscore0 = zeros(N,1);
for i = 1:N
    for j = 1:10
       Sumscore(i) = Sumscore(i)+sum(score((i-1)*10+j,:));
    end
    Sumscore(i)=Sumscore(i)/10;
end
for i=1:N
    Sumscore0(SwineNum(i))=Sumscore(i);
end
xlswrite('问题1葡萄酒评分表.xls',Sumscore0,5,'D2:D29');

%第二组（白）各个样酒的总分
clc,clear
score = xlsread('问题1葡萄酒评分表.xls',4,'D2:M281');
N=28;
SwineNum = xlsread('问题1葡萄酒评分表.xls',4,'N2:N281');
SwineNum(isnan(SwineNum))=[];
Sumscore = zeros(N,1);
Sumscore0 = zeros(N,1);
for i = 1:N
    for j = 1:10
       Sumscore(i) = Sumscore(i)+sum(score((i-1)*10+j,:));
    end
    Sumscore(i)=Sumscore(i)/10;
end
for i=1:N
    Sumscore0(SwineNum(i))=Sumscore(i);
end
xlswrite('问题1葡萄酒评分表.xls',Sumscore0,5,'E2:E29');

clc,clear
%求两个组各个样酒的平均标准差
%（分别用STD1、STD2、STD3、STD4表示）
score = xlsread('问题1葡萄酒评分表.xls',1,'D2:M271');
N=27;
SwineNum = xlsread('问题1葡萄酒评分表.xls',1,'N2:N271');
SwineNum(isnan(SwineNum))=[];
SumScore=zeros(N,10);
for i = 1:N
    for j = 1:10
       for k = 1:10
       SumScore(i,j) = SumScore(i,j)+score((i-1)*10+k,j);
       end
    end
end
SumScore=SumScore';
STD1 = sum(std(SumScore))/N%显示平均标准差

score = xlsread('问题1葡萄酒评分表.xls',2,'D2:M271');
N=27;
SwineNum = xlsread('问题1葡萄酒评分表.xls',2,'N2:N271');
SwineNum(isnan(SwineNum))=[];
SumScore=zeros(N,10);
for i = 1:N
    for j = 1:10
       for k = 1:10
       SumScore(i,j) = SumScore(i,j)+score((i-1)*10+k,j);
       end
    end
end
SumScore=SumScore';
STD2 = sum(std(SumScore))/N%显示平均标准差

score = xlsread('问题1葡萄酒评分表.xls',3,'D2:M281');
N=28;
SwineNum = xlsread('问题1葡萄酒评分表.xls',3,'N2:N281');
SwineNum(isnan(SwineNum))=[];
SumScore=zeros(N,10);
for i = 1:N
    for j = 1:10
       for k = 1:10
       SumScore(i,j) = SumScore(i,j)+score((i-1)*10+k,j);
       end
    end
end
SumScore=SumScore';
STD3 = sum(std(SumScore))/N%显示平均标准差

score = xlsread('问题1葡萄酒评分表.xls',4,'D2:M281');
N=28;
SwineNum = xlsread('问题1葡萄酒评分表.xls',4,'N2:N281');
SwineNum(isnan(SwineNum))=[];
SumScore=zeros(N,10);
for i = 1:N
    for j = 1:10
       for k = 1:10
       SumScore(i,j) = SumScore(i,j)+score((i-1)*10+k,j);
       end
    end
end
SumScore=SumScore';
STD4 = sum(std(SumScore))/N%显示平均标准差

