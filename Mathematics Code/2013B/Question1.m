clear all;clc;
for i=0:18
    if i<10
        t=strcat('00',int2str(i),'.bmp');
        cell{1,i+1}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件1\',t));
    else
        t=strcat('0',int2str(i),'.bmp');
        cell{1,i+1}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件1\',t));
    end
end
for i=1:19
level=graythresh(cell{1,i});
cell1{1,i}=im2bw(cell{1,i},level);  %图像二值化处理
end
for i=1:19
    for k=1:19
        xs(i,k)=0;
    for j=1:1980
        if(cell1{1,i}(j,72)==cell1{1,k}(j,1))    %求相似度的矩阵
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
    k=find(xs(i,[1:19])==da(i));  %求出两两相邻的矩阵
    lian(i,1)=i;                  %为前者
    lian(i,2)=k;                  %为后者
end
lian(wei,1)=0;%wei=7
tou=lian(wei,2);
xu(1)=tou;%9
for i=1:18
    xu(i+1)=lian(xu(i),2); %正确的图像排序序列
end
%根据求出的序列xu画图
for i=1:19
I(:,[72*(i-1)+1:72*i])=cell{1,xu(i)};  %将图复原
% size(cell{1,1})=1980 72
end
disp(circle);
imwrite(I,'question1.jpg','quality',100);   
imshow('question1.jpg')                      %输出图像