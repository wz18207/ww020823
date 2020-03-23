N='S0087';
M='S3676';
% 映射
if strcmp(N(1),'S')
for i=1:41
t=findstr(D{i,1},N);
if ~isempty(t)
N=tx(i);
break
end
end
if ischar(N)
N=str2double(N(2:end));
end
end
if strcmp(M(1),'S')
for i=1:41
t=findstr(D{i,1},M);
if ~isempty(t)
M=tx(i);
break
end
end
if ischar(M)
M=str2double(M(2:end));
end
end
% 直达
if Time(N,M)~=0
temp=S{N,M};
for i=1:size(temp,1)
if temp(i,1)>1040
disp(strcat('直达地铁为:',Lt1{temp(i,1),1}))
else
disp(strcat('直达汽车为:',Lt1{temp(i,1),1}))
end
end
end
clear U U2
% 一次转车
t=1:3996;
T2=Time(N,:).*Time(:,M)';
if sum(T2)~=0
x=1;
t=t(T2~=0);
for i=1:length(t)
t1=S{N,t(i)};
t2=S{t(i),M};
t1=double(t1);
t2=double(t2);
for j=1:size(t1,1)
for k=1:size(t2,1)
U{x,1}=1;%转站次数
U{x,8}=t1(j,2)+t2(k,2);%费用
if t1(j,1)>1040
if t2(k,1)>1040
U{x,2}=(t1(j,3)+t2(k,3))*2.5+4+2;%d d
U{x,8}=3;%2次地铁费用3
else
U{x,2}=t1(j,3)*2.5+t2(k,3)*3+7+2;%d g
end
else
if t2(k,1)>1040
U{x,2}=t1(j,3)*3+t2(k,3)*2.5+6+3;%g d
else
U{x,2}=t1(j,3)*3+t2(k,3)*3+5+3;%g g
end
end
U{x,3}=Cit{t(i)};%转站点
U{x,4}=Lt1{t1(j,1),1};%车辆
U{x,5}=Lt1{t2(k,1),1};
%是否始发站
temp=0;
if t2(k,1)<=1040
for k1=1:1040
if strcmp(Lt1{k1,1},U{x,5})
if Lt2{k1,1}(1,1)==t(i)
temp=1;
break
end
end
end
end
U{x,6}=temp;
U{x,7}=-sum(Time(:,t(i)))+...
sum(Time(t(i),:));%人流量
x=x+1;
end
end
end
return
end
%二次转车
t=1:3996;
x=1;
for i=1:3996
if Time(N,i)~=0
for j=1:3996
if Time(j,M)~=0 && Time(i,j)~=0
t1=S{N,i};
t2=S{i,j};
t3=S{j,M};
t1=double(t1);
t2=double(t2);
t3=double(t3);
for k1=1:size(t1,1)
for k2=1:size(t2,1)
for k3=1:size(t3,1)
U2{x,1}=2;%转站次数
%总时间
if t1(k1,1)>1040
if t2(k2,1)>1040
if t3(k3,1)>1040
%d d d
U2{x,2}=(t1(k1,3)+t2(k2,3)+t3(k3,3))*2.5+8+2;
U2{x,10}=3;
else
%d d g
U2{x,2}=2.5*t1(k1,3)+2.5*t2(k2,3)+3*t3(k3,3)+11+2;
U2{x,10}=3+t3(k3,2);
end
else
if t3(k3,1)>1040
%d g d
U2{x,2}=2.5*t1(k1,3)+3*t2(k2,3)+2.5*t3(k3,3)+13+2;
U2{x,10}=6+t2(k2,2);
else
%d g g
U2{x,2}=2.5*t1(k1,3)+3*t2(k2,3)+3*t3(k3,3)+12+2;
U2{x,10}=3+t2(k2,2)+t3(k3,2);
end
end
else
if t2(k2,1)>1040
if t3(k3,1)>1040
%g d d
U2{x,2}=3*t1(k1,3)+2.5*t2(k2,3)+2.5*t3(k3,3)+11+3;
U2{x,10}=t1(k1,2)+3;
else
%g d g
U2{x,2}=3*t1(k1,3)+2.5*t2(k2,3)+3*t3(k3,3)+13+3;
U2{x,10}=3+t1(k1,2)+t3(k3,2);
end
else
if t3(k3,1)>1040
%g g d
U2{x,2}=3*t1(k1,3)+3*t2(k2,3)+2.5*t3(k3,3)+11+3;
U2{x,10}=3+t1(k1,2)+t2(k2,2);
else
%g g g
U2{x,2}=3*t1(k1,3)+3*t2(k2,3)+3*t3(k3,3)+10+3;
U2{x,10}=t1(k1,2)+t2(k2,2)+t3(k3,2);
end
end
end
U2{x,3}=Cit{t(i)};%转站点
U2{x,4}=Cit{t(j)};%转站点
U2{x,5}=Lt1{t1(k1,1),1};%车辆1
U2{x,6}=Lt1{t2(k2,1),1};
%是否始发
temp=0;
if t2(k2,1)<=1040
for kk=1:1040
if strcmp(Lt1{kk,1},U2{x,6})
if Lt2{kk,1}(1,1)==t(i)
temp=1;
break
end
end
end
end
U2{x,7}=Lt1{t3(k3,1),1};%车辆3
%始发站数
if t3(k3,1)<=1040
for kk=1:1040
if strcmp(Lt1{kk,1},U2{x,7})
if Lt2{kk,1}(1,1)==t(j)
temp=temp+1;
break
end
end
end
end
U2{x,8}=temp;
%人流量
U2{x,9}=sum(Time(t(j),:))-...
sum(Time(:,t(j)))-...
sum(Time(:,t(i)))+...
sum(Time(t(i),:));
x=x+1;
end
end
end
end
end
end
end