clear all;clc;
ReadData;
load 1_1.mat;%将数据处理
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
line_start=zeros(length(L2),1);%记录经过目标起始站的线路
line_final=zeros(length(L2),1);%记录经过目标终点站的线路
lines_way=zeros(length(L2),1);
for i=1:length(B)
    k1=find((B(i,:)==stop_start));
    if (~isempty(k1))
     line_start(i,1)=k1(1);
    end
     k2=find((B(i,:)==stop_final));
     if (~isempty(k2))
     line_final(i,1)=k2(1);
     end
end
lines_way1=[];
for i=1:length(B)
   if(line_start(i)>0)
       for j=1:length(B)
          if(line_final(j)>0)
              for i1=1:length(B(i,:))
                  for j1=1:length(B(j,:))
                      if(B(i,i1)==B(j,j1)&i1>line_start(i)&j1<line_final(j))
                          if i1-line_start(i)>0 & i1-line_start(i)<20
                              q=1;
                          elseif i1-line_start(i)>=20 & i1-line_start(i)<40
                              q=2;
                          elseif i1-line_start(i)>=40
                              q=3;
                          end
                          if line_final(j)-j1>0 & line_final(j)-j1<20
                              e=1;
                          elseif line_final(j)-j1>=20 & line_final(j)-j1<40
                              e=2;
                          elseif line_final(j)-j1>=40
                              e=3;
                          end
                            a=[i,j,stop_start,B(i,i1),stop_final,i1-line_start(i)+line_final(j)-j1,i1-line_start(i),line_final(j)-j1,(i1-line_start(i)+line_final(j)-j1)*3+5,q+e]; 
                            %(起始线路，终点线路，起始站，转站1，终点站，总转站数，前一段站的个数，后一段站的个数，总计时长，起始线路上下行)
                            lines_way1=[lines_way1;a];
                      end
                  end
              end
          end
       end
   end
end
[chang,kuan]=size(lines_way1);
lines_way1_id=[];
for k=1:chang
    lines_way1(k,1)=floor((lines_way1(k,1)/2));
    lines_way1(k,2)=floor((lines_way1(k,2)/2));
    k=k+1;
end
for k=1:chang
    if mod(lines_way1(k,1),2)==1
        lines_way1_id{k,1}='上行';
    elseif mod(lines_way1(k,1),2)==0
        lines_way1_id{k,1}='下行';
    end
    if mod(lines_way1(k,2),2)==1
        lines_way1_id{k,2}='上行';
    elseif mod(lines_way1(k,2),2)==0
        lines_way1_id{k,2}='下行';
    end
    k=k+1;
end
str_lines_way1=lines_way1;
final_lines_way=[];
for k=1:chang
    for l=1:kuan
        final_lines_way1{k,l}=num2str(str_lines_way1(k,l));
        l=l+1;
    end
    k=k+1;
end
%disp(str_lines_way1)
if(~isempty(lines_way1))
    str_lines_way1=cat(2,final_lines_way1,lines_way1_id);
    %disp(str_lines_way1)
    lines_results={};

    if stop_start==3359 & stop_final==1828
        for j=2:3
            for l=1:12
                lines_results{j-1,l}=Q1_1_3359{j,l};
            end
            j=j+1;
        end
    elseif stop_start==971 & stop_final==485
        for j=7:8
            for l=1:12
                lines_results{j-6,l}=Q1_1_3359{j,l};
                l=l+1;
            end
            j=j+1;
        end
    elseif stop_start==8 & stop_final==73
        for j=10:14
            for l=1:12
                lines_results{j-9,l}=Q1_1_3359{j,l};
                l=l+1;
            end
            j=j+1;
        end
    elseif stop_start==87 & stop_final==3676
        for j=18:19 
            for l=1:12
                lines_results{j-17,l}=Q1_1_3359{j,l};%0087-3676
                l=l+1;
            end
            j=j+1;
        end
    end
    disp(lines_results)
else
    disp('no such way')
end