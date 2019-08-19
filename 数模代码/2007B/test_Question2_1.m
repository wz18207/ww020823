clear all;clc;
load B_1.mat;
load B_2.mat;
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
[chang11 kuan11]=find(B_1==stop_start);
[chang2 kuan2]=size(B_2);
