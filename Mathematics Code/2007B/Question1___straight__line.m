clear all;clc;
ReadData;%�����ݴ���
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
lines_start=zeros(length(L2),1);%��¼����Ŀ����ʼվ����·
lines_final=zeros(length(L2),1);%��¼����Ŀ���յ�վ����·
lines_way=zeros(length(L2),1);

for i=1:length(B)%ȥ��
    k1=find((B(i,:)==stop_start));
    if (~isempty(k1))
     lines_start(i,1)=k1(1);
    end
     k2=find((B(i,:)==stop_final));
     if (~isempty(k2))
     lines_final(i,1)=k2(1);
     end
end
for i=1:length(B)
    if((lines_start(i,1)>0)&(lines_final(i,1)>0)&(lines_start(i,1)<lines_final(i,1)))
      lines_way(i,1) =lines_final(i,1)-lines_start(i,1);
    end
end
if(~isempty(find(lines_way)>0))
   sparse(lines_way)
else
    disp('no straight lines')
end