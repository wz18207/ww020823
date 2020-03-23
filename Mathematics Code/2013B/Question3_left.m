clc;clear all;
A=imread( 'E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\000.bmp');
[m,n]=size(A);
countTotle=0; %黑色点的总个数
countSame=0; %相同点的个数
Used=zeros(209,1);
x=0;
pho =ones(m,n)*255;
sort=zeros(1,209);
local=0;
Left=zeros(1,209);
Right=zeros(1,209);
b=zeros(209,1);
for i=1:209;
 if i<11
 str=strcat( 'E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\00',num2str(i-1),'.bmp');
 elseif i>=11&&i<101
 str=strcat( 'E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\0',num2str(i-1),'.bmp');
 else i>=101
 str=strcat( 'E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\',num2str(i-1),'.bmp');
 end
 a(:,:,i)=imread(str); %第i张图片的像素矩阵
 left(:,1,i)=a(:,1,i); %第i张图片的左边第一列
 right(:,1,i)=a(:,n,i); %第i张图片的右边第一列
 Left(1,i)=length(find(left(:,1,i)==0))/3.2;
 Right(1,i)=length(find(right(:,1,i)==0))/3.2;
end
Left
Right
left(:,1,1)';
right(:,1,1)';
pic=cat(2,a(:,:,1),a(:,:,2));
imshow(pic)