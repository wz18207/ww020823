clear all;
clc;load test2.mat
dirname='E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����2\';
files=dir([dirname,'\*.bmp']);
Num_file=numel(files);
I=cell(1,Num_file)
for k = 1:19
I{k} = imread([dirname '\' files(k).name]);
end
 
for k=1:19
    J(k)=graythresh(I{k});
    P{k}=im2bw(I{k},J(k));
end
for k=1:19
    [le,n]=size(P{k});
    left{k}=P{k}(:,1);
    right{k}=P{k}(:,n);
end
for k=1:19
    for n=1:19
         if n==k
        else
    a(n,k)=sum(abs(left{n}-right{k}));
         end
    end
end
circle=[4,7,3,8,16,19,12,1,6,2,10,14,11,9,13,15,18,17,5];
for k=1:19
  
    circle2(k)=circle(20-k);
end
circle2;
for i=1:19
begin=72*(i-1)+1;
end_f=72*i;
num=circle2(i);
end
imshow(question2)