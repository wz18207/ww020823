clc,clear
RedGrape = xlsread('����3�������.xls',2,'B3:L29');
RedWine =  xlsread('����3�������.xls',5,'B3:H29');
%�Ժ����ѵ���ָ����й�һ��
for j = 1:11
    for i=1:27
        MAX = max(RedGrape(:,j));
        MIN = min(RedGrape(:,j));
        RedGrape(i,j) = (RedGrape(i,j) - MIN)/(MAX - MIN);
    end
end
%�Ժ����ѾƵ���ָ����й�һ��
for j = 1:7
    for i=1:27
        MAX = max(RedWine(:,j));
        MIN = min(RedWine(:,j));
        RedWine(i,j) = (RedWine(i,j) - MIN)/(MAX - MIN);
    end
end

%������ѵ��������ϵ������
x = RedGrape;
y = RedWine;
x1=[ones(size(x,1),1) x];
b1 = zeros(12,7);
stats1=zeros(4,7);
for i=1:7
     [b,bint,r,rint,stats]=regress(y(:,i),x1);
     b1(:,i)=b;
     stats1(:,i)=stats';
end
b1%�����ѵ��������ϵ������
stats1%�����ѵ�R-square��Fֵ��pֵ����


WhiteGrape = xlsread('����3�������.xls',4,'B3:O30');
WhiteWine =  xlsread('����3�������.xls',6,'B3:H30');
%�԰����ѵ���ָ����й�һ��
for j = 1:14
    for i=1:28
        MAX = max(WhiteGrape(:,j));
        MIN = min(WhiteGrape(:,j));
        WhiteGrape(i,j) = (WhiteGrape(i,j) - MIN)/(MAX - MIN);
    end
end
%�԰����ѾƵ���ָ����й�һ��
for j = 2:7
    for i=1:28
        MAX = max(WhiteWine(:,j));
        MIN = min(WhiteWine(:,j));
        WhiteWine(i,j) = (WhiteWine(i,j) - MIN)/(MAX - MIN);
    end
end
%������ѵ��������ϵ��
x = WhiteGrape;
y = WhiteWine;
x1=[ones(size(x,1),1) x];
b2 = zeros(15,7);
stats2=zeros(4,7);
for i=1:7
     [b,bint,r,rint,stats]=regress(y(:,i),x1);
     b2(:,i)=b;
     stats2(:,i)=stats';
end
b2%��ʾ�����ѵ��������ϵ������
stats2%��ʾ�����ѵ�R-square��Fֵ��pֵ����

