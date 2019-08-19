clear all;clc;load test2_red.mat;
A=xlsread('2012A_Table2.xls','酿酒葡萄指标汇总', 'C3:J29');% 红葡萄
%  数据标准化处理
a=size(A,1);  
b=size(A,2);  
for i=1:b
    SA(:,i)=(A(:,i)-mean(A(:,i)))/std(A(:,i)); 
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

% 提取主成分对应的特征向量
for j=1:Com_num
    PV(:,j)=V(:,b+1-j);
end
new_score=SA*PV;
for i=1:a
    total_score(i,1)=sum(new_score(i,:));
    total_score(i,2)=i;
end
result_report=[new_score, total_score]; % 将各主成分得分与总分放在同一个矩阵中
result_report=sortrows(result_report,(K+2)); % 按总分降序排序
A=result_report(:,(K+1));
[idx,ctr]=kmeans(A,4);
ctr=[72.952,68.592,68.535,71.827];
[m,n]=size(A);
t1=ones(1,n)*30;
c1=find(idx==1); c2=find(idx==2); c3=find(idx==3); c4=find(idx==4);
h=plot(t1,A,'ko',c1,A(idx==1),'k--*', c2,A(idx==2),'k--s', c3,A(idx==3),'k--d', c4,A(idx==4),'k--p');
xlabel('白葡萄酒样品编号','fontsize',12);%白酒
%xlabel('红葡萄酒样品编号','fontsize',12);%红酒
ylabel('主成分得分','fontsize',12);
title('白葡萄酒理化指标聚类图','fontsize',12)%白酒
%title('红葡萄酒理化指标聚类图','fontsize',12)%红酒
set(h, 'MarkerSize',8, 'MarkerFaceColor','k');
set(gca,'linewidth',2) ;
disp('主成分得分(最后1列为样本编号，倒数第2列为总分，前面为各主成分得分)')
result_report
disp(['result_line:',num2str(C1(5,1:4))])
disp('分类结果：');
disp(['第1类:' ,'中心点：',num2str(ctr(1)),'  ','该类样品编号：',num2str(C1(1,1:6))]);
disp(['第2类:' ,'中心点：',num2str(ctr(2)),'  ','该类样品编号：', num2str(C1(2,:))]);
disp(['第3类:' ,'中心点：',num2str(ctr(3)),'  ','该类样品编号：', num2str(C1(3,1:3))]);
disp(['第4类:' ,'中心点：',num2str(ctr(4)),'  ','该类样品编号：', num2str(C1(4,1:8))]);
