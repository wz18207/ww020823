clc,clear all
fid = fopen('E:\大学资料\2019年国赛数模\Text 2019.8.10\cumcm2007\2007高教社杯全国大学生数学建模竞赛题目\B2007data\1.1 公汽线路信息.txt','r');
i=1;
while 1
tline = fgetl(fid); %fgetl函数 一次仅读入一行，并返回这一行的字符串
if ~ischar(tline)
break
end % ischar:Determine whether item is character array(字符数组)
if strcmp(tline,'') % strcmp:Compare strings（比较两个输入字符串是否相等）
continue
end
if strcmp(tline(1),'L')
str=tline;
continue
elseif strcmp(tline,'END')
    break
end
if strcmp(tline,'单一票制1元。')
P=1;
continue
elseif strcmp(tline,'分段计价。')
P=2;
continue
end
if strcmp(tline(1:2),'上行')
L{i,1}=str;
L{i,2}=P;
L{i,3}='上行';
L{i,4}=tline(3:end);
i=i+1;
continue
elseif strcmp(tline(1:2),'下行')
L{i,1}=str;
L{i,2}=P;
L{i,3}='下行';
L{i,4}=tline(3:end);
i=i+1;
continue
elseif strcmp(tline(1:2),'环行')
L{i,1}=str;
L{i,2}=P;
L{i,3}='环行1';
L{i,4}=strcat(tline(4:end),tline(9:end));
i=i+1;
%计算来回
L{i,1}=str;
L{i,2}=P;
L{i,3}='环行2';
L{i,4}=strcat(tline(4:end),tline(9:end));
i=i+1;
continue
elseif strcmp(tline(1),'S')
L{i,1}=str;
L{i,2}=P;
L{i,3}='来回1';
L{i,4}=tline;
i=i+1;
%计算来回
L{i,1}=str;
L{i,2}=P;
L{i,3}='来回2';
L{i,4}=tline;
i=i+1;
continue
end
end
fclose(fid);

for i=1:size(L,1)
tline=L{i,4};
t=findstr(tline,'S'); %在一个长的字符串里面找到一个子串；
temp=zeros(1,length(t));
if strcmp(L{i,3},'来回2') || strcmp(L{i,3},'环行2')
for j=length(t):-1:1
temp(length(t)-j+1)=str2double(tline(t(j)+1:t(j)+4));
end
else
for j=1:length(t)
temp(j)=str2double(tline(t(j)+1:t(j)+4));
end
end
L2{i,1}=temp;
end

for i=1:3957
if floor(i/10)==0
Cit{i}=strcat('S000',num2str(i));
elseif floor(i/100)==0
Cit{i}=strcat('S00',num2str(i));
elseif floor(i/1000)==0
Cit{i}=strcat('S0',num2str(i));
else
Cit{i}=strcat('S',num2str(i));
end
end 

longest_stops=0;%寻找最长的线路站点
B=[];%将站点信息存入矩阵中

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