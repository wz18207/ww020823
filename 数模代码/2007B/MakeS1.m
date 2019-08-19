clear S
S(1:3957,1:3957)={zeros(1,1,'uint16')};
for i=1:1040
t=L2{i,1};
for j=1:length(t)-1
for k=j+1:length(t)
temp=S{t(j),t(k)};
str=L{i,1};
[n,m]=size(temp);
if n==1 && temp(1,1)==0
temp(n,1)=str2double(str(2:end));
if L{i,2}==2
if (k-j)>40
temp(n,2)=3;
elseif (k-j)>20
temp(n,2)=2;
else
temp(n,2)=1;
end
else
temp(n,2)=1;
end
temp(n,3)=k-j;
else
temp(n+1,1)=str2double(str(2:end));
if L{i,2}==2
if (k-j)>40
temp(n+1,2)=3;
elseif (k-j)>20
temp(n+1,2)=2;
else
temp(n+1,2)=1;
end
else
temp(n+1,2)=1;
end
temp(n+1,3)=k-j;
end
S{t(j),t(k)}=temp;
end
end
end
for i=1:3957
for j=1:3957
if length(S{i,j})~=1
S{i,j}=T_SORT(S{i,j}',3,1)';
end
end
end
Time=zeros(3957,3957,'uint8');
for i=1:3957
for j=1:3957
if length(S{i,j})~=1
Time(i,j)=size(S{i,j},1);
end
end
end
TT=zeros(3957,3957,'uint8');
for i=1:3957
for j=1:3957
temp=S{i,j};
if temp(1,1)~=0
TT(i,j)=temp(1,3);
end
end
end