clear all;
clc;
sjchuli;%将数据处理
longest_stops=0;%寻找最长的线路站点
B=[];%将站点信息存入矩阵中
b_1=[];
b_2=[];
stop_start=2160;
stop_final=2019;
lines_start=zeros(length(L2),1);%记录经过目标起始站的线路
lines_final=zeros(length(L2),1);%记录经过目标终点站的线路
lines_way=zeros(length(L2),1);
for i=1:length(L2)
    c=L2{i,1:1};
  if (longest_stops<length(c))
      longest_stops=length(c);
  end
end
for i=1:length(L2)
    A=L2{i,1:1};
    A1=zeros(1,longest_stops-length(A));
    A=[A A1];
    B=[B;A];
end
for i=1:length(B)
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
    if((lines_start(i,1)>0)&(lines_final(i,1)>0))
      lines_way(i,1) =lines_final(i,1)-lines_start(i,1);
    end
end
if(sum(lines_start)==0||sum(lines_final==0)
    disp('no such line')
    
elseif((sum(lines_start)==0)&(sum(lines_final==0)))
     if (sum(lines_way)>0) 
        sparse(lines_way)
   end
   elseif(sum(lines_way)==0) 
      for j=1:length(lines_start)
          k3=find(lines_start>0);
          if(~isempty(k3))
              b_1=[b_1 k3];
          end
          k4=find(lines_final>0);
          if(~isempty(k4));
              b_2=[b_2 k4];
          end
      end
     if(~isempty(b_1)&~isempty(b_2))
         for i=1:length(b_1)
             for j=1:length(b_2)
                 b_3=intersect(B((b_1(i),:),B((b_2(j),:))));
                if(~isempty(b_3))
                    
                    
          
          
          
          
          
