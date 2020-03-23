clear all;clc;
A_1=xlsread('testing_data_others.xlsx','Sheet1','C3:L3');
load test_2.mat;
each_abs=zeros(1,10);
for i=1:10
    each_abs(1,i)=abs(A_1(1,i));
    i=i+1;
end
sum_abs=sum(each_abs);
percent_abs=zeros(1,10);
for i=1:10
    percent_abs(1,i)=(each_abs(1,i)/sum_abs);
    i=i+1;
end
percent_clear=zeros(1,26);
percent_colors=zeros(1,26);
for j=1:26
        percent_clear(1,j)=X2(2*j-1,1)*percent_abs(1,1)+X2(2*j-1,2)*percent_abs(1,1)+X2(2*j-1,3)*percent_abs(1,1)+X2(2*j-1,4)*percent_abs(1,1)+X2(2*j-1,5)*percent_abs(1,1)+X2(2*j-1,6)*percent_abs(1,1)+X2(2*j-1,7)*percent_abs(1,1)+X2(2*j-1,8)*percent_abs(1,1)+X2(2*j-1,9)*percent_abs(1,1)+X2(2*j-1,10)*percent_abs(1,1);
        percent_colors(1,j)=X2(2*j,1)*percent_abs(1,2)+X2(2*j,2)*percent_abs(1,2)+X2(2*j,3)*percent_abs(1,2)+X2(2*j,4)*percent_abs(1,2)+X2(2*j,5)*percent_abs(1,2)+X2(2*j,6)*percent_abs(1,2)+X2(2*j,7)*percent_abs(1,2)+X2(2*j,8)*percent_abs(1,2)+X2(2*j,9)*percent_abs(1,2)+X2(2*j,10)*percent_abs(1,2);
        j=j+1;
end
percent_results=zeros(1,27);
for i=1:26
    percent_results(1,27)=22;
    percent_results(1,i)=percent_colors(1,i)+percent_clear(1,i);
    i=i+1;
end

