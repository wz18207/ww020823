clear all;clc;load Question2_white.mat;
X=A_white';%白酒
numC=7;
for i=1:numC
    kidx = kmeans(X,i);
    silh = silhouette(X,kidx); %计算轮廓值(距离值)
    silh_m(i) = mean(silh);    %计算平均轮廓值4
end
figure
plot(1:numC,silh_m,'ko-', 'linewidth',2)
set(gca,'linewidth',2);
xlabel('类别数')
ylabel('平均轮廓值')
title(' 不同类别对应的平均轮廓值')

% 绘制2至5类时的轮廓值分布图
 figure
 set(gca,'linewidth',2);
for i=2:5
    kidx = kmeans(X,i);
    subplot(2,2,i-1);
    [~,h] = silhouette(X,kidx);
    set(gca,'linewidth',2);
    title([num2str(i), '类时的轮廓值 ' ])
    snapnow
    xlabel('轮廓值');
    ylabel('类别数');
end
X=A_white';
Y=pdist(X);  %计算样品间的欧式距离
Z=linkage(Y, 'average');  % 利用类平均法创建系统聚类树
cn=size(X);
clabel=1:cn;
clabel=clabel';
figure
F2 = dendrogram(Z); % 绘制聚类树形图
set(gca,'linewidth',2);
title('层次聚类法聚类结果')
set(F2,'linewidth',2);
ylabel('标准距离');