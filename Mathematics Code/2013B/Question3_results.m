clear all;clc;
%д�����ݵ�������
cell{1,1}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\038.bmp'));
cell{1,2}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\148.bmp'));
cell{1,3}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\046.bmp'));
cell{1,4}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\161.bmp'));
cell{1,5}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\024.bmp'));
cell{1,6}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\035.bmp'));
cell{1,7}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\081.bmp'));
cell{1,8}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\189.bmp'));
cell{1,9}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\122.bmp'));
cell{1,10}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\103.bmp'));
cell{1,11}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\130.bmp'));
cell{1,12}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\193.bmp'));
cell{1,13}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\088.bmp'));
cell{1,14}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\167.bmp'));
cell{1,15}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\025.bmp'));
cell{1,16}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\008.bmp'));
cell{1,17}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\009.bmp'));
cell{1,18}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\105.bmp'));
cell{1,19}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\074.bmp'));
disp(cell)
[hang,lie]=size(cell);
all_files=zeros(hang,cell*lie);
all_files(:,1:lie)=