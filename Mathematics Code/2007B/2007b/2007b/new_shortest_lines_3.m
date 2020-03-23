clear all;clc;
ReadData;%将数据处理
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
lines_start=zeros(length(L2),1);%记录经过目标起始站的线路
lines_final=zeros(length(L2),1);%记录经过目标终点站的线路
lines_way2=zeros(length(L2),1);
lines_ant_start=zeros(length(L2),1);
lines_ant_final=zeros(length(L2),1);

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
lines_way_2=[];
jlu_s=find(lines_start>0);
jlu_f=find(lines_final>0);
for i=1:length(jlu_s)
     for j=1:length(jlu_f)
          for i1=(lines_start(jlu_s(i),1))+1:length(B(jlu_s(i),:))
                if(B(jlu_s(i),i1)>0)
                  for j1=lines_final(jlu_f(j),1)-1:-1:1
                      if(B(jlu_f(j),j1)>0)
                        for j2=1:length(B)
                            if((j2~=j1)&(j2~=i1))
                                 k3=find((B(j2,:)==B(i,i1)));
                                 if (~isempty(k3))
                                      lines_ant_start(i,1)=k3(1);
                                 end
                                 k4=find((B(j2,:)==B(j,j1)));
                                 if (~isempty(k4))
                                      lines_ant_final(i,1)=k4(1);
                                 end
                            end
                        end
                        for i2=1:length(B)
                             if((lines_ant_start(i,1)>0)&(lines_ant_final(i,1)>0)&(lines_ant_start(i,1)<lines_ant_final(i,1)))
                                  lines_way2(i,1) =lines_ant_final(i,1)-lines_ant_start(i,1);
                             end
                        end
                       
                       end
                  end
              end
          end
          if(~isempty(lines_way2))
                           for i3=1:length(lines_way2)
                               if(lines_way2(i3,1)~=0)
                               a_1=[lines_start(i),i3,lines_final(j),stop_start,B(i3,lines_ant_start(i3,1)),B(i3,lines_ant_final(i3,1)),stop_final];
                               lines_way_2=[lines_way_2;a_1];
                               end
                           end
                       end
       end
end
          
if(~isempty(lines_way_2))
    %if(lines_way_2(i,12)==min(lines(:,12)))
    %for i=1:length(lines_way(:,1))
        %f=(L{jlu_s(i),2}==1)+(L{jlu_s(i),2}==2)*(((ceil(m/20)>2)*3+(ceil(m/20)<=2)*ceil(m/20)))
    lines_way_2
%else
    %disp('no such way')
end





