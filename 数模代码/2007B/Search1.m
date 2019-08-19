N=87;
M=3676;
% 直达
if Time(N,M)~=0
temp=S{N,M};
for i=1:size(temp,1)
disp(strcat('直达车为:L',num2str(temp(i,1))))
end
return
end
clear U U2
% 一次转车
t=1:3957;
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
U(x,1)=1;%转站次数
U(x,2)=(t1(j,3)+t2(k,3))*3+5+3;%总时间
U(x,3)=t(i);%转站点
U(x,4:5)=[t1(j,1) t2(k,1)];%车辆
%是否始发站
temp=0;
for k1=1:1040
if str2double(L{k1,1}(2:end))==U(x,5)
if L2{k1,1}(1,1)==t(i)
temp=1;
break
end
end
end
U(x,6)=temp;
U(x,7)=-sum(Time(:,t(i)))+...
sum(Time(t(i),:));%人流负载
U(x,8)=t1(j,2)+t2(k,2);%费用
x=x+1;
end
end
end
return
end
%二次转车
t=1:3957;
x=1;
for i=1:3957
if Time(N,i)~=0
for j=1:3957
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
U2(x,1)=2;%转站次数
%总时间
U2(x,2)=(t1(k1,3)+t2(k2,3)+t3(k3,3))*3+10+3;
U2(x,3)=t(i);%转站点
U2(x,4)=t(j);%转站点
U2(x,5:6)=[t1(k1,1) t2(k2,1)];%车辆1,2
%是否始发
temp=0;
for kk=1:1040
if str2double(L{kk,1}(2:end))==U2(x,6)
if L2{kk,1}(1,1)==t(i)
temp=1;
break
end
end
end
U2(x,7)=t3(k3,1);%车辆3
%始发站数
for kk=1:1040
if str2double(L{kk,1}(2:end))==U2(x,7)
if L2{kk,1}(1,1)==t(j)
temp=temp+1;
break
end
end
end
U2(x,8)=temp;
%人流量
U2(x,9)=sum(Time(t(j),:))-...
sum(Time(:,t(j)))-...
sum(Time(:,t(i)))+...
sum(Time(t(i),:));
%费用
U2(x,10)=t1(k1,2)+t2(k2,2)+t3(k3,2);
x=x+1;
end
end
end
end
end
end
end