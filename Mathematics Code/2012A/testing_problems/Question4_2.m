
%*****************************************************************
%����4����ڶ�������ʦ�Ը������Ƶ�ÿһָ������־�ֵ
%������д��'����1���Ѿ����ֱ�.xls'�ĵ�6��7����������
%*****************************************************************

 %�ڶ��飨��ƣ��������Ƶĸ���ָ������
clc,clear
score = xlsread('����1���Ѿ����ֱ�.xls',2,'O2:O271');
N=27;
SwineNum = xlsread('����1���Ѿ����ֱ�.xls',2,'N2:N271');
SwineNum(isnan(SwineNum))=[];
Sumscore0 = zeros(27,10);

for i=1:N
    for j=1:10
        Sumscore0(SwineNum(i),j)=score((i-1)*10+j);
    end
end
xlswrite('����1���Ѿ����ֱ�.xls',Sumscore0,6,'B2:K28');

%�ڶ��飨�׾ƣ��������Ƶĸ���ָ������
clc,clear
score = xlsread('����1���Ѿ����ֱ�.xls',4,'O2:O281');
N=28;
SwineNum = xlsread('����1���Ѿ����ֱ�.xls',4,'N2:N281');
SwineNum(isnan(SwineNum))=[];
Sumscore0 = zeros(N,10);

for i=1:N
    for j=1:10
        Sumscore0(SwineNum(i),j)=score((i-1)*10+j);
    end
end
xlswrite('����1���Ѿ����ֱ�.xls',Sumscore0,7,'B2:K29');

