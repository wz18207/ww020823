clear all;clc;load Question2_red.mat;
X=A_red';%红酒
numC=7;
for i=1:numC
    kidx = kmeans(X,i);
    silh = silhouette(X,kidx); %计算轮廓值
    silh_m(i) = mean(silh);    %计算平均轮廓值
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
[idx,ctr]=kmeans(A_red',4); % 用K-means法聚类
% 提取同一类别的样品号
c1=find(idx==1); c2=find(idx==2); 
c3=find(idx==3); c4=find(idx==4); 
figure
F1 = plot(find(idx==1), A_red(idx==1),'k:*', ...
     find(idx==2), A_red(idx==2),'k:o', ...
     find(idx==3), A_red(idx==3),'k:p', ...
     find(idx==4), A_red(idx==4),'k:d');
set(gca,'linewidth',2);
set(F1,'linewidth',2, 'MarkerSize',8);
xlabel('编号','fontsize',12);
ylabel('得分','fontsize',12);
title('Kmeans方法聚类结果')
disp('聚类结果：');
disp(['第1类:' ,'中心点：',num2str(ctr(1)),'  ','该类样品编号：', num2str(c1')]);
disp(['第2类:' ,'中心点：',num2str(ctr(2)),'  ','该类样品编号：', num2str(c2')]);
disp(['第3类:' ,'中心点：',num2str(ctr(3)),'  ','该类样品编号：', num2str(c3')]);
disp(['第4类:' ,'中心点：',num2str(ctr(4)),'  ','该类样品编号：', num2str(c4')]);
% X=A_red';
% Y=pdist(X);  %计算样品间的欧式距离
% Z=linkage(Y, 'average');  % 利用类平均法创建系统聚类树
% cn=size(X);
% clabel=1:cn;
% clabel=clabel';
% figure
% F2 = dendrogram(Z); % 绘制聚类树形图
% set(gca,'linewidth',2);
% title('层次聚类法聚类结果')
% set(F2,'linewidth',2);
% ylabel('标准距离');
% X=A_red';
% [center,U] = fcm(X,4);
% Cid1 = find(U(1,:) ==max(U));
% Cid2 = find(U(2,:) ==max(U));
% Cid3 = find(U(3,:) ==max(U));
% Cid4 = find(U(4,:) ==max(U));
% figure
% F3=plot(Cid1, A_red(Cid1),'k:*', ...
%      Cid2, A_red(Cid2),'k:o', ...
%      Cid3, A_red(Cid3),'k:p', ...
%      Cid4, A_red(Cid4),'k:d');
% 
% set(gca,'linewidth',2);
% set(F3,'linewidth',2, 'MarkerSize',8);
% xlabel('编号');
% ylabel('得分');
% title('Fuzzy C-means方法聚类结果')