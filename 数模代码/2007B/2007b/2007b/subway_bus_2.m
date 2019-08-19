clear all;
clc;
load('B');
load('B_1');
load('B_2');
load('L');
%sjchuli;%将数据处理
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
lines_start=zeros(length(B),1);%记录经过目标起始站的线路
lines_final=zeros(length(B),1);%记录经过目标终点站的线路
lines_way2=zeros(length(B),1);
lines=[];
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
     for line_way=1:length(jlu_f)
          for i1=(lines_start(jlu_s(i),1))+1:length(B(jlu_s(i),:))
                if(B(jlu_s(i),i1)>0)
                  for j1=lines_final(jlu_f(line_way),1)-1:-1:1
                      if(B(jlu_f(line_way),j1)>0) 
                          [x,y]=find(B_1==B(jlu_s(i),i1));
                          [x1,y1]=find(B_1==B(jlu_f(line_way),j1));
                          %T1
                          if(~isempty([x,y])&& ~isempty([x1,y1]))
                              m=i1-(lines_start(jlu_s(i),1));
                              n=lines_final(jlu_f(line_way),1)-j1;
                              f=(L{jlu_s(i),2}==1)+(L{jlu_s(i),2}==2)*(((ceil(m/20)>2)*3+(ceil(m/20)<=2)*ceil(m/20)))+...
                                 (L{jlu_f(line_way),2}==1)+(L{jlu_f(line_way),2}==2)*(((ceil(n/20)>2)*3+(ceil(n/20)<=2)*ceil(n/20)));
                              a=[jlu_s(i),1,jlu_f(line_way),stop_start,B(jlu_s(i),i1),x,x1,B(jlu_f(line_way),j1),stop_final,...
                                 m,n,3*(m+n)+2.5*(abs(x1-x))+5+6,f+3];
                              lines=[lines;a];
                          end
                           [x2,y2]=find(B_2==B(jlu_s(i),i1));
                          [x3,y4]=find(B_2==B(jlu_f(line_way),j1));
                          %T2
                          if(~isempty([x2,y2])&& ~isempty([x3,y4]))
                              m=i1-(lines_start(jlu_s(i),1));
                              n=lines_final(jlu_f(line_way),1)-j1;
                              f=(L{jlu_s(i),2}==1)+(L{jlu_s(i),2}==2)*(((ceil(m/20)>2)*3+(ceil(m/20)<=2)*ceil(m/20)))+...
                                 (L{jlu_f(line_way),2}==1)+(L{jlu_f(line_way),2}==2)*(((ceil(n/20)>2)*3+(ceil(n/20)<=2)*ceil(n/20)));
                              a=[jlu_s(i),2,jlu_f(line_way),stop_start,B(jlu_s(i),i1),x2,x3,B(jlu_f(line_way),j1),stop_final,...
                                  m,n,3*(m+n)+2.5*(abs(x2-x3))+5+6,f+3];
                              lines=[lines;a];
                          end
                       
                       end
                  end
              end
          end
          
       end
end
line_way=1;
disp('时间最少')
 disp('起始站公交线(1)-中转换乘地铁(2)-终点站公交线(3)-线路(4-9)-第一次公汽站数(10)-第二次公汽站数(11)-总时间(12)花费(13)')
for i=1:length(lines(:,1))
     if(lines(i,12)==min(lines(:,12)))
         line_way
         
        
         b={L{lines(i,1),3},lines(i,2),L{lines(i,3),3}}
         lines(i,:)
         line_way=line_way+1;
     end
end
disp('花费最少')
disp('起始站公交线(1)-中转换乘地铁(2)-终点站公交线(3)-线路(4-9)-第一次公汽站数(10)-第二次公汽站数(11)-总时间(12)-花费')
line_way2=1;
for i=1:length(lines(:,1))
     if(lines(i,13)==min(lines(:,13)))
         line_way2
         
         lines(i,:)
         line_way2=line_way2+1;
     end
end






