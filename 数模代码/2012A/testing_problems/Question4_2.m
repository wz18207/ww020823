
%*****************************************************************
%问题4：求第二组评酒师对各个样酒的每一指标的评分均值
%并将其写入'问题1葡萄酒评分表.xls'的第6、7个工作表中
%*****************************************************************

 %第二组（红酒）各个样酒的各个指标评分
clc,clear
score = xlsread('问题1葡萄酒评分表.xls',2,'O2:O271');
N=27;
SwineNum = xlsread('问题1葡萄酒评分表.xls',2,'N2:N271');
SwineNum(isnan(SwineNum))=[];
Sumscore0 = zeros(27,10);

for i=1:N
    for j=1:10
        Sumscore0(SwineNum(i),j)=score((i-1)*10+j);
    end
end
xlswrite('问题1葡萄酒评分表.xls',Sumscore0,6,'B2:K28');

%第二组（白酒）各个样酒的各个指标评分
clc,clear
score = xlsread('问题1葡萄酒评分表.xls',4,'O2:O281');
N=28;
SwineNum = xlsread('问题1葡萄酒评分表.xls',4,'N2:N281');
SwineNum(isnan(SwineNum))=[];
Sumscore0 = zeros(N,10);

for i=1:N
    for j=1:10
        Sumscore0(SwineNum(i),j)=score((i-1)*10+j);
    end
end
xlswrite('问题1葡萄酒评分表.xls',Sumscore0,7,'B2:K29');

