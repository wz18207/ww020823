function [ COVMAT ] = covarianceMatrix( inputData )
% ? covarianceMatrix( inputData )
% ? ����һ������Э�������ĺ���
% ? inputData ? ��������
% ? ÿһ��Ϊһ��ά��
% ? ÿһ��Ϊһ������
%�����������ά��
[m,n] = size(inputData);
%����Э�������
COVMAT = zeros(m,m);
%ȡ��ÿά����ƽ��ֵ
E = zeros(m,1);
for i = 1:m
    E(i) = mean(inputData(i,:));
end
%����Э����
for i = 1:m
    for j = 1:m
        COVMAT(i,j) = ((inputData(i,:)-E(i))*(inputData(j,:)-E(j))')./(n-1);
    end
end