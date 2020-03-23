clear all;clc;
load E_3.mat
load P_3.mat
syms t
P_total=[];
P_1=((E_3(1,1)/0.863)*(0.883*2.2)*(0.7)^2*sqrt(((2*(100+50/20-100))/0.863)-0.863*44))/(12500*pi);
P_total=[P_total,imag(P_1)];
for i =2:20
    P_2=((E_3(1,i)/0.863)*(0.863*2.2)*(0.7)^2*sqrt(((2*(100+50/20-100))/0.863)-0.863*44))/(12500*pi);
    %P_2=P_2-P_1;
    P_total=[P_total,imag(P_2)];
    P_2=[];
    i=i+1;
end
 Qt=[];
for qt=1:20
     Qt=[Qt,qt];
     qt=qt+1;
end

disp(P_total)
% P_total=[];
% P_1=((E_3(1,1)/0.85)*(0.85*t)*(0.7)^2*sqrt(((2*(100+50-100))/0.85)-0.85*44))/(12500*pi);
% P_total=[P_total,P_1];
% t_results=(50*531250000*pi)/(531993*85^(1/2)*6821^(1/2));
% disp(t_results)