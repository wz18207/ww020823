clc,clear all
%fid = fopen('E:\大学资料\2019年国赛数模\Text 2019.8.10\cumcm2007\2007高教社杯全国大学生数学建模竞赛题目\B2007data\地铁T2换公交.txt','r');
fid = fopen('E:\大学资料\2019年国赛数模\Text 2019.8.10\cumcm2007\2007高教社杯全国大学生数学建模竞赛题目\B2007data\地铁T2换公交.txt','r');
i=1;
while 1
tline = fgetl(fid); %fgetl函数 一次仅读入一行，并返回这一行的字符串
if ~ischar(tline)
break
end % ischar:Determine whether item is character array(字符数组)
 L_1{i,1}=tline;
 i=i+1;
end
fclose(fid);

for i=1:size(L_1,1)
tline=L_1{i,1};
t=findstr(tline,'S'); %在一个长的字符串里面找到一个子串；
temp=zeros(1,length(t));

for j=1:length(t)
temp(j)=str2double(tline(t(j)+1:t(j)+4));
end
L2{i,1}=temp;
end

for i=1:3506
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
B_1=[];%将站点信息存入矩阵中

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
    %B_1=[B_1;A];
    B_2=[B_2;A];
end
