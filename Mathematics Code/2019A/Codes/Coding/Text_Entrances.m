clear all;clc;
%syms p q
%f1=log(p)/log(q);
%v=int(f1,p,q);
%disp(v)
%syms pa
%E=1489*exp(0.00284*pa)+48.79*exp(0.01376*pa);
%k_100MPa=(1489*exp(0.00284*100)+48.79*exp(0.01376*100))/0.85;
%rou=E/k_100MPa;%���������ȼ��ϵ��k�ڹܵ������޶��ڲ������κθı�
syms x
f=1476*exp(0.00401*x);
k=int(f,x);
disp(k)
% x = linspace(1:1000:100);
% f=[];
% for i =x
%     f =[1476*exp(0.00401*i), f]; 
% end
%a=(147600000*exp((401*100)/100000))/401;
%disp(a)


