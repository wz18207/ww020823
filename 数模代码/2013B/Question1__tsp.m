clear all;
clc;load test1.mat
dirname='E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件1\';
files=dir([dirname,'\*.bmp']);
Num_file=numel(files);
I=cell(1,Num_file);
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
circle=[8,14,12,15,3,10,2,16,1,4,5,9,13,18,11,7,17,0,6];
for k=1:19
  
    circle2(k)=circle(20-k);
end
circle2;
for i=1:19
begin=72*(i-1)+1;
end_f=72*i;
num=circle2(i);
end
imshow(question1)