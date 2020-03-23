clear all;clc;load Question2_white.mat;
X=A_white';%�׾�
numC=7;
for i=1:numC
    kidx = kmeans(X,i);
    silh = silhouette(X,kidx); %��������ֵ(����ֵ)
    silh_m(i) = mean(silh);    %����ƽ������ֵ4
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
X=A_white';
Y=pdist(X);  %������Ʒ���ŷʽ����
Z=linkage(Y, 'average');  % ������ƽ��������ϵͳ������
cn=size(X);
clabel=1:cn;
clabel=clabel';
figure
F2 = dendrogram(Z); % ���ƾ�������ͼ
set(gca,'linewidth',2);
title('��ξ��෨������')
set(F2,'linewidth',2);
ylabel('��׼����');