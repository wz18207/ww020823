function [] = shortest_lines( stop_start,stop_final )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
clear all;
clc;
sjchuli;%�����ݴ���
lines_start=zeros(length(L2),1);%��¼����Ŀ����ʼվ����·
lines_final=zeros(length(L2),1);%��¼����Ŀ���յ�վ����·
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

