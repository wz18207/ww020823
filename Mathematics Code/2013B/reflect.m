clear all;clc;
files=dir('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\*.bmp') %��������ͼ��
figure;
A=zeros(1,180);%1*180����
for n=1:numel(files) %Ԫ�ظ���
    image{n}=imread(['E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\',files(n).name]);
end
[x,y]=size(image{1});
flag1=zeros(x,n);
for i=1:n
    for j=1:x
        sum=0;
        for k=1:y
            if image{i}(j,k)<255
                break;
            else
            	sum=sum+1;
            end
        end
        if sum ==y
            flag1(j,i)=0;
        else
            flag1(j,i)=1;
        end
    end
end
