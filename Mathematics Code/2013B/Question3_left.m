clc;clear all;
A=imread( 'E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\000.bmp');
[m,n]=size(A);
countTotle=0; %��ɫ����ܸ���
countSame=0; %��ͬ��ĸ���
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
 str=strcat( 'E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\00',num2str(i-1),'.bmp');
 elseif i>=11&&i<101
 str=strcat( 'E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\0',num2str(i-1),'.bmp');
 else i>=101
 str=strcat( 'E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\',num2str(i-1),'.bmp');
 end
 a(:,:,i)=imread(str); %��i��ͼƬ�����ؾ���
 left(:,1,i)=a(:,1,i); %��i��ͼƬ����ߵ�һ��
 right(:,1,i)=a(:,n,i); %��i��ͼƬ���ұߵ�һ��
 Left(1,i)=length(find(left(:,1,i)==0))/3.2;
 Right(1,i)=length(find(right(:,1,i)==0))/3.2;
end
Left
Right
left(:,1,1)';
right(:,1,1)';
pic=cat(2,a(:,:,1),a(:,:,2));
imshow(pic)