
%*****************************************************
%����2���󾭹�SPSS����η��������ָ��ֵ
%������д��'����2��(��)��������.xls'�ĵ�5����������
%*****************************************************

clc,clear
%������
%��ȡ��SPSS���ɷַ�������������
component = xlsread('����2����������.xls',3,'B4:I33');%����ɷ־���
Eig = xlsread('����2����������.xls',2,'A1:A30');%�������ϵ�����������ֵ
for i=1:8
    component(:,i) = component(:,i)./sqrt(Eig);
end
xlswrite('����2����������.xls',component,4,'B4:I33');%�������ɷ�ϵ������

zhibiao = xlsread('����2����������.xls',1,'C2:AF28');
for i=1:27
    for j=1:8
        f(i,j) =  component(:,j)'*zhibiao(i,:)';%�����ɷַ���ȷ������ָ��ֵ
    end
end
xlswrite('����2����������.xls',f,5,'B3:I29');%������ָ��ֵ

clc,clear
%������
%��ȡ��SPSS���ɷַ�������������
component = xlsread('����2����������.xls',3,'B4:J33');%����ɷ־���
Eig = xlsread('����2����������.xls',2,'A1:A30');%�������ϵ�����������ֵ
for i=1:9
    component(:,i) = component(:,i)./sqrt(Eig);
end
xlswrite('����2����������.xls',component,4,'B4:J33');%�������ɷ�ϵ������

zhibiao = xlsread('����2����������.xls',1,'C2:AF29');

for i=1:28
    for j=1:9
        f(i,j) =  component(:,j)'*zhibiao(i,:)';%�����ɷַ���ȷ������ָ��ֵ
    end
end
xlswrite('����2����������.xls',f,5,'B3:J30');%������ָ��ֵ

