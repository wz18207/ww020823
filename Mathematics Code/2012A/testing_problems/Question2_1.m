
%*****************************************************
%问题2：求经过SPSS主层次分析后的新指标值
%并将其写入'问题2红(白)葡萄数据.xls'的第5个工作表中
%*****************************************************

clc,clear
%红葡萄
%读取经SPSS主成分分析后的相关数据
component = xlsread('问题2红葡萄数据.xls',3,'B4:I33');%读入成分矩阵
Eig = xlsread('问题2红葡萄数据.xls',2,'A1:A30');%读入相关系数矩阵的特征值
for i=1:8
    component(:,i) = component(:,i)./sqrt(Eig);
end
xlswrite('问题2红葡萄数据.xls',component,4,'B4:I33');%保存主成分系数矩阵

zhibiao = xlsread('问题2红葡萄数据.xls',1,'C2:AF28');
for i=1:27
    for j=1:8
        f(i,j) =  component(:,j)'*zhibiao(i,:)';%由主成分分析确定的新指标值
    end
end
xlswrite('问题2红葡萄数据.xls',f,5,'B3:I29');%保存新指标值

clc,clear
%白葡萄
%读取经SPSS主成分分析后的相关数据
component = xlsread('问题2白葡萄数据.xls',3,'B4:J33');%读入成分矩阵
Eig = xlsread('问题2白葡萄数据.xls',2,'A1:A30');%读入相关系数矩阵的特征值
for i=1:9
    component(:,i) = component(:,i)./sqrt(Eig);
end
xlswrite('问题2白葡萄数据.xls',component,4,'B4:J33');%保存主成分系数矩阵

zhibiao = xlsread('问题2白葡萄数据.xls',1,'C2:AF29');

for i=1:28
    for j=1:9
        f(i,j) =  component(:,j)'*zhibiao(i,:)';%由主成分分析确定的新指标值
    end
end
xlswrite('问题2白葡萄数据.xls',f,5,'B3:J30');%保存新指标值

