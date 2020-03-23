clear all;clc;
%写入数据到胞数组
cell{1,1}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\038.bmp'));
cell{1,2}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\148.bmp'));
cell{1,3}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\046.bmp'));
cell{1,4}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\161.bmp'));
cell{1,5}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\024.bmp'));
cell{1,6}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\035.bmp'));
cell{1,7}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\081.bmp'));
cell{1,8}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\189.bmp'));
cell{1,9}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\122.bmp'));
cell{1,10}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\103.bmp'));
cell{1,11}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\130.bmp'));
cell{1,12}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\193.bmp'));
cell{1,13}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\088.bmp'));
cell{1,14}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\167.bmp'));
cell{1,15}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\025.bmp'));
cell{1,16}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\008.bmp'));
cell{1,17}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\009.bmp'));
cell{1,18}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\105.bmp'));
cell{1,19}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\074.bmp'));
disp(cell)
[hang,lie]=size(cell);
all_files=zeros(hang,cell*lie);
all_files(:,1:lie)=