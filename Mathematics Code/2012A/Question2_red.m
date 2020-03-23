clear all;clc;load Question2_red.mat;
X=A_red';%���
numC=7;
for i=1:numC
    kidx = kmeans(X,i);
    silh = silhouette(X,kidx); %��������ֵ
    silh_m(i) = mean(silh);    %����ƽ������ֵ
end
figure
plot(1:numC,silh_m,'ko-', 'linewidth',2)
set(gca,'linewidth',2);
xlabel('�����')
ylabel('ƽ������ֵ')
title(' ��ͬ����Ӧ��ƽ������ֵ')

% ����2��5��ʱ������ֵ�ֲ�ͼ
 figure
 set(gca,'linewidth',2);
for i=2:5
    kidx = kmeans(X,i);
    subplot(2,2,i-1);
    [~,h] = silhouette(X,kidx);
    set(gca,'linewidth',2);
    title([num2str(i), '��ʱ������ֵ ' ])
    snapnow
    xlabel('����ֵ');
    ylabel('�����');
end
[idx,ctr]=kmeans(A_red',4); % ��K-means������
% ��ȡͬһ������Ʒ��
c1=find(idx==1); c2=find(idx==2); 
c3=find(idx==3); c4=find(idx==4); 
figure
F1 = plot(find(idx==1), A_red(idx==1),'k:*', ...
     find(idx==2), A_red(idx==2),'k:o', ...
     find(idx==3), A_red(idx==3),'k:p', ...
     find(idx==4), A_red(idx==4),'k:d');
set(gca,'linewidth',2);
set(F1,'linewidth',2, 'MarkerSize',8);
xlabel('���','fontsize',12);
ylabel('�÷�','fontsize',12);
title('Kmeans����������')
disp('��������');
disp(['��1��:' ,'���ĵ㣺',num2str(ctr(1)),'  ','������Ʒ��ţ�', num2str(c1')]);
disp(['��2��:' ,'���ĵ㣺',num2str(ctr(2)),'  ','������Ʒ��ţ�', num2str(c2')]);
disp(['��3��:' ,'���ĵ㣺',num2str(ctr(3)),'  ','������Ʒ��ţ�', num2str(c3')]);
disp(['��4��:' ,'���ĵ㣺',num2str(ctr(4)),'  ','������Ʒ��ţ�', num2str(c4')]);
% X=A_red';
% Y=pdist(X);  %������Ʒ���ŷʽ����
% Z=linkage(Y, 'average');  % ������ƽ��������ϵͳ������
% cn=size(X);
% clabel=1:cn;
% clabel=clabel';
% figure
% F2 = dendrogram(Z); % ���ƾ�������ͼ
% set(gca,'linewidth',2);
% title('��ξ��෨������')
% set(F2,'linewidth',2);
% ylabel('��׼����');
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
% xlabel('���');
% ylabel('�÷�');
% title('Fuzzy C-means����������')