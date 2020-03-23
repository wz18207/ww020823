clear all;
clc
load('B');
load('B_1');
load('B_2');
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
lines_start=zeros(length(B),1);%记录经过目标起始站的线路
lines_final=zeros(length(B),1);%记录经过目标终点站的线路
lines_way=zeros(length(B),1);

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
%起点在汽车线，终点在地铁T1
if(sum(lines_start)>0 && ~isempty(find(B_1)==stop_final))
    [x,y]=find((B_1)==stop_final);
    for i=1:length(jlu_s)
        for j=lines_start(jlu_s(i))+1:length(B(jlu_s(i),:))
            [x1,y1]=find((B_1)==B(jlu_s(i),j));
            if(B(jlu_s(i),j)>0 && ~isempty([x1,y1]))
                disp('起点在汽车线，终点在地铁T1')
                lines=[stop_start,B(jlu_s(i),j),stop_final,lines_start(jlu_s(i)),j-jlu_s(i),abs(x-x1)]
            end
        end
    end
end
%起点在汽车线，终点在地铁T2
if(sum(lines_start)>0 && ~isempty(find(B_2)==stop_final))
    [x,y]=find((B_2)==stop_final);
    for i=1:length(jlu_s)
        for j=lines_start(jlu_s(i))+1:length(B(jlu_s(i),:))
            [x1,y1]=find((B_2)==B(jlu_s(i),j));
            if(B(jlu_s(i),j)>0 && ~isempty([x1,y1]))
                disp('起点在汽车线，终点在地铁T2')
                lines=[stop_start,B(jlu_s(i),j),stop_final,lines_start(jlu_s(i)),j-jlu_s(i),abs(x-x1)]
            end
        end
    end
end        
 %起点在地铁T1，终点在汽车线
if(sum(lines_final)>0 && ~isempty(find(B_1)==stop_start))
    [x,y]=find((B_1)==stop_start);
    for i=1:length(jlu_f)
        for j=lines_final(jlu_f(i))-1:-1:1
            [x1,y1]=find((B_1)==B(jlu_f(i),j));
            if(B(jlu_f(i),j)>0 && ~isempty([x1,y1]))
                disp('起点在地铁T1，终点在汽车线')
                lines=[stop_start,B(jlu_f(i),j),stop_final,lines_final(jlu_f(i)),lines_final(jlu_f(i))-j,abs(x-x1)]
            end
        end
    end
end           
%起点在地铁T2，终点在汽车线
if(sum(lines_final)>0 && ~isempty(find(B_2)==stop_start))
    [x,y]=find((B_2)==stop_start);
    for i=1:length(jlu_f)
        for j=lines_final(jlu_f(i))-1:-1:1
            [x1,y1]=find((B_2)==B(jlu_f(i),j));
            if(B(jlu_f(i),j)>0 && ~isempty([x1,y1]))
                disp('起点在地铁T1，终点在汽车线')
                lines=[stop_start,B(jlu_f(i),j),stop_final,lines_final(jlu_f(i)),lines_final(jlu_f(i))-j,abs(x-x1)]
            end
        end
    end
end           
            
                
                
                
    