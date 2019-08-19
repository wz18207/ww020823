function [] = shortest_lines( stop_start,stop_final )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
clear all;
clc;
sjchuli;%将数据处理
lines_start=zeros(length(L2),1);%记录经过目标起始站的线路
lines_final=zeros(length(L2),1);%记录经过目标终点站的线路
lines_way=zeros(length(L2),1);

for i=1:length(B)
    k1=find((B(i,:)==stop_start))
    if (~isempty(k1))
     lines_start(i,1)=k1(1);
    end
     k2=find((B(i,:)==stop_final))
     if (~isempty(k2))
     lines_final(i,1)=k2(1);
     end
end
lines_way =lines_final-lines_start;
if(sum(lines_way)==0)
   sparse(lines_way)
else
    disp('no straight lines')
end

