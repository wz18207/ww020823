clear all;clc;load test2_white.mat;
load test2_function_white.mat;
load Question2_white.mat;
A=xlsread('2012A_Table2.xls','酿酒葡萄指标汇总', 'C34:J61');% 白葡萄
%  数据标准化处理
a=size(A,1);  
b=size(A,2);  
percent_idom=[19.442,15.983,12.173,6.287,5.572,5.114,4.249,4.14];
for i=1:b
    SA(:,i)=(A(:,i)-mean(A(:,i)))/std(A(:,i))*percent_idom(1,i); 
end
CM=corrcoef(SA);  % 计算相关系数矩阵(correlation matrix)
[V, D]=eig(CM);  % 计算特征值和特征向量
for j=1:b
    DS(j,1)=D(b+1-j, b+1-j); % 对特征值按降序进行排序
end
for i=1:b
    DS(i,2)=DS(i,1)/sum(DS(:,1)); %贡献率
    DS(i,3)=sum(DS(1:i,1))/sum(DS(:,1)); %累积贡献率
end
T=0.8;  % 主成分信息保留率.
for K=1:b
    if DS(K,3)>=T
        Com_num=K;
        break;
    end
end
X_white_true=A_white;
X_write=zeros(1,27);
X_write(1,1)=1.342;X_write(1,6)=0.859;X_write(1,14)=1.972;X_write(1,20)=2.345;
X_write(1,25)=1.272;
% 提取主成分对应的特征向量
for j=1:Com_num
    PV(:,j)=V(:,b+1-j);
end
new_score=SA*PV;
for i=1:a
    total_score(i,1)=sum(new_score(i,:));
    total_score(i,2)=i;
end
cursor=[0.25644,0.21080,0.16050,0.09220,0.22370,0.05600];
result_report=[new_score, total_score]; % 将各主成分得分与总分放在同一个矩阵中
result_report=sortrows(result_report,(K+2)); % 按总分降序排序
A=result_report(:,(K+1));
options=statset('MaxIter',1000);
gmm = gmdistribution.fit(A,4,'Covtype','Diagonal','Regularize',1e-10,'Options',options);
result = posterior(gmm, A);
disp(result)
result_lines=zeros(1,28);
for i=1:28
    result_lines(1,i)=result(i,1)+result(i,2)+result(i,3)+result(i,4);
end
dim1=result(:,1);
dim2=result(:,2);
dim3=result(:,3);
dim4=result(:,4);
dim1_1=zeros(1,28);dim2_1=zeros(1,28);dim3_1=zeros(1,28);dim4_1=zeros(1,28);
for i=1:28
    if dim1(i,1)>0
        dim1_1(1,i)=dim1(i,1);
    else
        break;
    end
    if dim2(i,1)>0
        dim2_1(1,i)=dim1(i,1);
    else
        break;
    end
    if dim3(i,1)>0
        dim3_1(1,i)=dim1(i,1);
    else
        break;
    end
    if dim4(i,1)>0
        dim4_1(1,i)=dim1(i,1);
    else
        break;
    end
end
disp(element)
X_white_true=A_white-X_write;
disp(['result_line:',num2str(C1(5,1:4))]);
disp('分类结果：');
disp(['第1类:' ,'该类样品编号：',num2str(C1(1,1:7))]);
disp(['第2类:' ,'该类样品编号：', num2str(C1(2,:))]);
disp(['第3类:' ,'该类样品编号：', num2str(C1(3,1:6))]);
disp(['第4类:' ,'该类样品编号：', num2str(C1(4,1:4))]);