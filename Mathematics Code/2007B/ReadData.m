clc,clear all
fid = fopen('E:\��ѧ����\2019�������ģ\Text 2019.8.10\cumcm2007\2007�߽��籭ȫ����ѧ����ѧ��ģ������Ŀ\B2007data\1.1 ������·��Ϣ.txt','r');
i=1;
while 1
tline = fgetl(fid); %fgetl���� һ�ν�����һ�У���������һ�е��ַ���
if ~ischar(tline)
break
end % ischar:Determine whether item is character array(�ַ�����)
if strcmp(tline,'') % strcmp:Compare strings���Ƚ����������ַ����Ƿ���ȣ�
continue
end
if strcmp(tline(1),'L')
str=tline;
continue
elseif strcmp(tline,'END')
    break
end
if strcmp(tline,'��һƱ��1Ԫ��')
P=1;
continue
elseif strcmp(tline,'�ֶμƼۡ�')
P=2;
continue
end
if strcmp(tline(1:2),'����')
L{i,1}=str;
L{i,2}=P;
L{i,3}='����';
L{i,4}=tline(3:end);
i=i+1;
continue
elseif strcmp(tline(1:2),'����')
L{i,1}=str;
L{i,2}=P;
L{i,3}='����';
L{i,4}=tline(3:end);
i=i+1;
continue
elseif strcmp(tline(1:2),'����')
L{i,1}=str;
L{i,2}=P;
L{i,3}='����1';
L{i,4}=strcat(tline(4:end),tline(9:end));
i=i+1;
%��������
L{i,1}=str;
L{i,2}=P;
L{i,3}='����2';
L{i,4}=strcat(tline(4:end),tline(9:end));
i=i+1;
continue
elseif strcmp(tline(1),'S')
L{i,1}=str;
L{i,2}=P;
L{i,3}='����1';
L{i,4}=tline;
i=i+1;
%��������
L{i,1}=str;
L{i,2}=P;
L{i,3}='����2';
L{i,4}=tline;
i=i+1;
continue
end
end
fclose(fid);

for i=1:size(L,1)
tline=L{i,4};
t=findstr(tline,'S'); %��һ�������ַ��������ҵ�һ���Ӵ���
temp=zeros(1,length(t));
if strcmp(L{i,3},'����2') || strcmp(L{i,3},'����2')
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

longest_stops=0;%Ѱ�������·վ��
B=[];%��վ����Ϣ���������

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