clear all;
clc
load('B');
load('L');
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
lines_start=zeros(length(L2),1);%记录经过目标起始站的线路
lines_final=zeros(length(L2),1);%记录经过目标终点站的线路
lines_way=zeros(length(L2),1);
%lines_way2=zeros(length(L2),1);
lines_ant_start=zeros(length(L2),1);
lines_ant_final=zeros(length(L2),1);
lines_ant_way=zeros(length(L2),1);
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
%直达
 lines=[];
for i=1:length(jlu_s)
   
    if((lines_final(jlu_s(i))>0)&&(lines_start(jlu_s(i))<lines_final(jlu_f(i))))
        
        a=[jlu_s(i),lines_final(jlu_f(i))-lines_start(jlu_s(i))];
        lines=[lines;a];
    end
end
if(~isempty(lines))
    lines_way=1;
    disp('直达线路  经过站')
    for i=1:length(lines(:,1))
     if(lines(i,2)==min(lines(:,2)))
         lines_way
        
         b={ceil(lines(i,1)/2),L{lines(i,1),3},lines(i,2)}
         line_way=line_way+1;
     end
    end
   elseif(isempty(lines))
         disp('没有直达线路')
         %换乘一次
         lines_way1=[];
         for i=1:length(jlu_s)
             
              for j=1:length(jlu_f)
                    
                     for i1=lines_start(jlu_s(i)):length(B(jlu_s(i),:))
                            for j1=lines_final(jlu_f(j)):-1:1
                                   if(B(jlu_s(i),i1)==B(jlu_f(j),j1))
                                        a=[jlu_s(i),jlu_f(j),stop_start,B(jlu_s(i),i1),stop_final,i1-lines_start(jlu_s(i))+lines_final(jlu_f(j))-j1]; 
                                        lines_way1=[lines_way1;a];
             
                                   end
                               end
                          end
                     end
         end
         if(~isempty(lines_way1))
             wayhc2=0;
            disp('换乘一次')
            disp('起始线-终点线-起始站-换乘站-终点站-乘车站')
            for i=1:length(lines_way1)
               if(lines_way1(i,6)==min(lines_way1(:,6)))
               wayhc2=wayhc2+1
               b={ceil(lines_way1(i,1)/2),L{lines_way1(i,1),3},ceil(lines_way1(i,2)/2),L{lines_way1(i,2),3},lines_way1(i,3)...
                   ,lines_way1(i,4),lines_way1(i,5)}
               end
          end
        
         elseif(isempty(lines_way1))
      disp('no such way1')
         end
end
%换乘两次
lines_way_2=[];
for i=1:length(jlu_s)
     for j=1:length(jlu_f)
          for i1=(lines_start(jlu_s(i),1))+1:length(B(jlu_s(i),:))
                if(B(jlu_s(i),i1)>0)
                  for j1=lines_final(jlu_f(j),1)-1:-1:1
                      if(B(jlu_f(j),j1)>0)
                        for j2=1:length(B)
                            if((j2~=jlu_s(i))&&(j2~=jlu_f(j)))
                                 k3=find((B(j2,:)==B(jlu_s(i),i1)));
                                 k4=find((B(j2,:)==B(jlu_f(j),j1)));
                                 if ((~isempty(k3))&&(~isempty(k4))&&(k3(1)<k4(1)))
                                      lines_ant_start(j2,1)=k3(1);
                                      lines_ant_final(j2,1)=k4(1);
                                      m=i1-lines_start(jlu_s(i),1);
                                      n=lines_final(jlu_f(j),1)-j1;
                                      p =lines_ant_final(j2,1)-lines_ant_start(j2,1);
                                      a_1=[jlu_s(i),j2,jlu_f(j)...
                                      ,stop_start,B(j2,lines_ant_start(j2,1)),B(j2,...
                                      lines_ant_final(j2,1)),stop_final,m,p,n,m+n+p];
                                      
                                      lines_way_2=[lines_way_2;a_1];
                                 end
                                 
                                
                            end
                        end
                       
                        end
                       
                      end
                  end
                end
          end
end
if(~isempty(lines_way_2))
    disp('换乘两次路线')
    for i=1:length(lines_way_2(:,1))
    if(lines_way_2(i,11)==min(lines_way_2(:,11)))
         b_1=[ceil(lines_way_2(i,1)/2),ceil(lines_way_2(i,2)/2),ceil(lines_way_2(i,3)/2)]
        b_2={L{lines_way_2(i,1),3},L{lines_way_2(i,2),3},L{lines_way_2(i,3),3}}
        lines_way_2(i,4:end)
    end
    end
    elseif(isempty(lines_way_2))
    disp('no such way2')
end
        
        
    