clear all;clc;
for i=0:18
    if i<10
        t=strcat('00',int2str(i),'.bmp');
        cell{1,i+1}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����1\',t));
    else
        t=strcat('0',int2str(i),'.bmp');
        cell{1,i+1}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����1\',t));
    end
end
for i=1:19
level=graythresh(cell{1,i});
cell1{1,i}=im2bw(cell{1,i},level);  %ͼ���ֵ������
end
for i=1:19
    for k=1:19
        xs(i,k)=0;
    for j=1:1980
        if(cell1{1,i}(j,72)==cell1{1,k}(j,1))    %�����ƶȵľ���
            xs(i,k)=1+xs(i,k);
        end
    end
    end
end
%load 'ti1.mat';
load Question1.mat
circle=[circle];
for i=1:19
    xs(i,i)=0;
end 
for i=1:19
da(i)=max(xs(i,:));
end
wei=find(da==max(da));
for i=1:19
    k=find(xs(i,[1:19])==da(i));  %����������ڵľ���
    lian(i,1)=i;                  %Ϊǰ��
    lian(i,2)=k;                  %Ϊ����
end
lian(wei,1)=0;%wei=7
tou=lian(wei,2);
xu(1)=tou;%9
for i=1:18
    xu(i+1)=lian(xu(i),2); %��ȷ��ͼ����������
end
%�������������xu��ͼ
for i=1:19
I(:,[72*(i-1)+1:72*i])=cell{1,xu(i)};  %��ͼ��ԭ
% size(cell{1,1})=1980 72
end
disp(circle);
imwrite(I,'question1.jpg','quality',100);   
imshow('question1.jpg')                      %���ͼ��