clear all;clc;
load r_len.mat
load theta.mat
pa=[];rou=[];E=[];
for j=1:518
    rou=[rou,0.85+(j*2.5097*10^(-5))];
    pa=[pa,100+0.4983*j];
    E=[E,2171.4+2.3590*j];
    j=j+1;
end
W_results=[];
for i=2:518
    W_results_row=(2.413+pi*(r_len(1,i)*theta(1,i)-r_len(i-1)*theta(i-1))*pi+2.413*pi)/((2*(pi^2)*((r_len(1,i-1)^2)-(r_len(1,i-1)^2)-(r_len(1,i-1)))/628)-0.85*(0.7^2)*((2*E(1,i-1)*pi)/628)*sqrt((2*(pa(1,i-1)-100))/rou(1,i-1)));
    if W_results_row>0
        W_results=[W_results,W_results_row];
    else
        W_results=[W_results];
    end
    i=i+1;
end
[lie,hang]=size(W_results);
W_results_true=[W_results(1,1)];
% ÄÚ´æÕ¨ÁË¡£
% for t=2:hang
%     W_results_true=[W_results_true,W_results(1,t)+W_results_true];
%     t=t+1;
% end
Qt=[];
for k=1:258
    Qt=[Qt,k*0.005];
    k=k+1;
end
disp(W_results)
plot(Qt,W_results)
syms x;
f=1/(int((-338)*(x^9)+2096*(x^8)-5507*(x^7)+7980*(x^6)-6958*(x^5)+3738*(x^4)-1218*(x^3)+228.3*(x^2)-21.33*x+1.26,0,1.29));
f=vpa(f,4);
disp(f)