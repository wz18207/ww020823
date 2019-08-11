clear;
load Question3.mat;
files=dir('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\*.bmp');
figure;
for n=1:numel(files);
    image{n}=imread(['E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\',files(n).name]);
end
data=Question3';
[center,U,obj_fcn]=fcm(data,11);
maxU=max(U);
index(1).t=find(U(1,:)==maxU);
index(2).t=find(U(2,:)==maxU);
index(3).t=find(U(3,:)==maxU);
index(4).t=find(U(4,:)==maxU);
index(5).t=find(U(5,:)==maxU);