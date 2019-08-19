clear all;
clc;

sjchuli;%将数据处理
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
lines_start=zeros(length(L2),1);%记录经过目标起始站的线路
lines_final=zeros(length(L2),1);%记录经过目标终点站的线路
lines_way2=zeros(length(L2),1);

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

jlu_s=find(lines_start>0);
jlu_f=find(lines_final>0);
for i=1:length(jlu_s)
     for j=1:length(jlu_f)
          for i1=(lines_start(jlu_s(i),1))+1:length(B(jlu_s(i),:))
                if(B(jlu_s(i),i1)>0)
                  for j1=lines_final(jlu_f(j),1)-1:-1:1
                      if(B(jlu_f(j),j1)>0)
                        for j2=1:length(B)
                            if((j2~=j1)&&(j2~=i1))
                                k3=find((B(j2,:)==B(jlu_s(i),i1)));
                                k4=find((B(j2,:)==B(jlu_f(j),j1)));
                                if(~isempty(k3)&&~isempty(k4))
                                    
                                   lines_way_2=[stop_start,B(jlu_s(i),i1),B(jlu_f(j),j1),stop_final,jlu_s(i),j2,jlu_f(j)]
                                end
                            end
                        end
                        
                       
                       end
                  end
              end
          end
          
       end
end
          





