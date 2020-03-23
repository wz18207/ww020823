clear all;clc;
load E_3.mat
load P_3.mat
% syms t
% P_total=[];
% P_1=((E_3(1,1)/0.85)*(0.85*t)*(0.7)^2*sqrt(((2*(100+50/20-100))/0.85)-0.85*44))/(12500*pi);
% P_total=[P_total,P_1];
% for i =2:20
%     P_2=((E_3(1,i)/0.85)*(0.85*t)*(0.7)^2*sqrt(((2*(100+50/20-100))/0.85)-0.85*44))/(12500*pi);
%     P_2=P_2-P_1;
%     disp(P_2)
%     P_total=[P_total,P_2];
%     P_2=[];
%     i=i+1;
% end
% disp(P_total)
P_0=((E_3(1,1)/0.85)*(0.85*0.1)*(0.7)^2*sqrt(((2*(100+50/20-100))/0.85)-0.85*44))/(12500*pi);
v_B=[];V_B=[];P_total_imag=[];
for t=0:240
    if t>=0 && t<=20
        v_B_i=t;
        v_B=[v_B,v_B_i];
    elseif t>20 && t<=220
        v_B_i=20;
        v_B=[v_B,v_B_i];
    elseif t>220 && t<=240
        v_B_i=-1*t+240;
        v_B=[v_B,v_B_i];
    end
    v_B_i=[];
    t=t+1;
end
for T=0:240
    if T>=0 && T<=20
        V_B_i=(1/200)*T;
        V_B=[V_B,V_B_i];
    elseif T>20 && T<=220
        V_B_i=0.2*T-2;
        V_B=[V_B,V_B_i];
    elseif T>220 && T<=240
        V_B_i=(-1/200)*(T)^2+2.4*T-244;
        V_B=[V_B,V_B_i];
    end
    V_B_i=[];
    T=T+1;
end
T_num=20;%change the generations of the dates.
P_total=[];
P_1=((E_3(1,1)/0.85)*(0.85*t)*(0.7)^2*sqrt(((2*(100+50/20-100))/0.85)-0.85*44))/(12500*pi);
P_total=[P_total,P_1];
for i =2:100
    P_2=((E_3(1,i)/(0.85+0.13*i))*((0.85+0.13*i)*t)*(0.7)^2*sqrt(((2*(100+50/20-100))/(0.85+0.13*i))-(0.85+0.13*i)*44))/(12500*pi);
    %P_2=P_2-P_1;
    P_total=[P_total,P_2];
    P_2=[];
    i=i+1;
end
[lie,hang]=size(P_total);
for imag_num=1:hang
    P_total_imag=[P_total_imag,(imag(P_total(1,imag_num))/5)];%change the datas.
    imag_num=imag_num+1;
end
 Qt=[];
for qt=1:100
     Qt=[Qt,qt];
     qt=qt+1;
end
x=Qt;y=P_total_imag;
plot(Qt,P_total_imag)
disp(P_total_imag)
