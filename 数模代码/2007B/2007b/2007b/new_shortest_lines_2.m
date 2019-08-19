clear all;
clc;

sjchuli;%将数据处理
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
lines_start=zeros(length(L2),1);%记录经过目标起始站的线路
lines_final=zeros(length(L2),1);%记录经过目标终点站的线路
lines_way=zeros(length(L2),1);

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
lines_way1=[];
for i=1:length(B)
   if(lines_start(i)>0)
       for j=1:length(B)
          if(lines_final(j)>0)
              for i1=1:length(B(i,:))
                  for j1=1:length(B(j,:))
                      if(B(i,i1)==B(j,j1)&i1>lines_start(i)&j1<lines_final(j))
                        a=[i,j,stop_start,B(i,i1),stop_final,i1-lines_start(i)+lines_final(j)-j1]; 
                         lines_way1=[lines_way1;a];
             
                      end
                  end
              end
          end
       end
   end
end
if(~isempty(lines_way1))
    lines_way1
else
    disp('no such way')
end