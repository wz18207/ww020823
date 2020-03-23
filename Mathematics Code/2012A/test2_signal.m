clear all;clc;
load Question2_red.mat;
load Question2_white.mat;
%  A=xlsread('2012A_Table2.xls','�������ָ�����', 'C3:J29');% ������
A=xlsread('2012A_Table2.xls','�������ָ�����', 'C34:J61');% ������
%  ���ݱ�׼������
a=size(A,1);  
b=size(A,2);  
for i=1:b
    SA(:,i)=(A(:,i)-mean(A(:,i)))/std(A(:,i)); 
end
CM=corrcoef(SA);  % �������ϵ������(correlation matrix)
[V, D]=eig(CM);  % ��������ֵ����������
for j=1:b
    DS(j,1)=D(b+1-j, b+1-j); % ������ֵ�������������
end
for i=1:b
    DS(i,2)=DS(i,1)/sum(DS(:,1)); %������
    DS(i,3)=sum(DS(1:i,1))/sum(DS(:,1)); %�ۻ�������
end
T=0.8;  % ���ɷ���Ϣ������.
for K=1:b
    if DS(K,3)>=T
        Com_num=K;
        break;
    end
end

% ��ȡ���ɷֶ�Ӧ����������
for j=1:Com_num
    PV(:,j)=V(:,b+1-j);
end
new_score=SA*PV;
for i=1:a
    total_score(i,1)=sum(new_score(i,:));
    total_score(i,2)=i;
end
result_report=[new_score, total_score]; % �������ɷֵ÷����ַܷ���ͬһ��������
result_report=sortrows(result_report,(K+2)); % ���ֽܷ�������
A=result_report(:,(K+1));
[idx,ctr]=kmeans(A,4);
[m,n]=size(A);
disp(A_red)
disp(A_white)