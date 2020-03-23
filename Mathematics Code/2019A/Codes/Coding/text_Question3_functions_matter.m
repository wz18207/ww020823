clear all;clc;
syms x;
t=[];
for i=1:90
    t=[t,i*0.01];
end
f=[];
for j=1:90
    if t(1,j)>=0 && t(1,j)<=0.45
        f_j=2.01*exp(-((t(1,j)-0.4543)/0.1655)^2);
        f=[f,f_j];
    elseif t(1,j)>=0.45 && t(1,j)<=0.9
        f_j=2.017*exp(-(((t(1,j))-0.443)/0.1661)^2);
        f=[f,f_j];
    end
    j=j+1;
end
f_results_1=int((pi/3)*(tan(9)^2)*((((0.7/tan(9))+(2.01*exp(-((x-0.4543)/0.1655)^2)))^3)-(0.7/tan(9))^3),0,0.45);
f_results_1=f_results_1*0.85;
f_results_2=int((pi/3)*(tan(9)^2)*((((0.7/tan(9))+(2.017*exp(-((x-0.443)/0.1661)^2)))^3)-(0.7/tan(9))^3),0,0.45);
f_results_2=f_results_2*0.85;
f_results=[vpa(f_results_1,4)+vpa(f_results_2,4)];%变化区域的总面积计算：Dv*delta(t)
syms T;%恒定增量随时间而速率恒定（B1,B2）
f_results_T=int((pi/3)*(tan(9)^2)*((((0.7/tan(9))+2*T)^3)-(0.7/tan(9))^3),0.45,T+0.45);
f_results=[f_results+(f_results_T)*0.85+0.5403];
% W=1.595e-50*T*(2.284e49*(T)^3 - 2.958e49*(T)^2 + 1.437e49*T + 3.922e49) + 0.8562;
disp(vpa(f_results,4))