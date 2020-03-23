
%******************************************************
%����1����������������Ƶ��ּܷ�ƽ����׼��
%������д��'����1���Ѿ����ֱ�.xls'�ĵ�5����������
%******************************************************

%��һ�飨�죩�������Ƶ��ܷ�
clc,clear
score = xlsread('����1���Ѿ����ֱ�.xls',1,'D2:M271');
N=27;
SwineNum = xlsread('����1���Ѿ����ֱ�.xls',1,'N2:N271');
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
xlswrite('����1���Ѿ����ֱ�.xls',Sumscore0,5,'B2:B28');

%�ڶ��飨�죩�������Ƶ��ܷ�
clc,clear
score = xlsread('����1���Ѿ����ֱ�.xls',2,'D2:M271');
N=27;
SwineNum = xlsread('����1���Ѿ����ֱ�.xls',2,'N2:N271');
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
xlswrite('����1���Ѿ����ֱ�.xls',Sumscore0,5,'C2:C28');

%��һ�飨�ף��������Ƶ��ܷ�
clc,clear
score = xlsread('����1���Ѿ����ֱ�.xls',3,'D2:M281');
N=28;
SwineNum = xlsread('����1���Ѿ����ֱ�.xls',3,'N2:N281');
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
xlswrite('����1���Ѿ����ֱ�.xls',Sumscore0,5,'D2:D29');

%�ڶ��飨�ף��������Ƶ��ܷ�
clc,clear
score = xlsread('����1���Ѿ����ֱ�.xls',4,'D2:M281');
N=28;
SwineNum = xlsread('����1���Ѿ����ֱ�.xls',4,'N2:N281');
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
xlswrite('����1���Ѿ����ֱ�.xls',Sumscore0,5,'E2:E29');

clc,clear
%��������������Ƶ�ƽ����׼��
%���ֱ���STD1��STD2��STD3��STD4��ʾ��
score = xlsread('����1���Ѿ����ֱ�.xls',1,'D2:M271');
N=27;
SwineNum = xlsread('����1���Ѿ����ֱ�.xls',1,'N2:N271');
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
STD1 = sum(std(SumScore))/N%��ʾƽ����׼��

score = xlsread('����1���Ѿ����ֱ�.xls',2,'D2:M271');
N=27;
SwineNum = xlsread('����1���Ѿ����ֱ�.xls',2,'N2:N271');
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
STD2 = sum(std(SumScore))/N%��ʾƽ����׼��

score = xlsread('����1���Ѿ����ֱ�.xls',3,'D2:M281');
N=28;
SwineNum = xlsread('����1���Ѿ����ֱ�.xls',3,'N2:N281');
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
STD3 = sum(std(SumScore))/N%��ʾƽ����׼��

score = xlsread('����1���Ѿ����ֱ�.xls',4,'D2:M281');
N=28;
SwineNum = xlsread('����1���Ѿ����ֱ�.xls',4,'N2:N281');
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
STD4 = sum(std(SumScore))/N%��ʾƽ����׼��

