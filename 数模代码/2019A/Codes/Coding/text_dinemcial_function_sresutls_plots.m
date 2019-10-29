clear all;clc;
[x,y]=dsolve('D2x+2*Dx=x+2*y-exp(-t)','Dy=4*x+3*y+4*exp(-t)');
[T,Y]=ode15s('vdp',[0 1000],[2 0]);
plot(T,Y(:,1));