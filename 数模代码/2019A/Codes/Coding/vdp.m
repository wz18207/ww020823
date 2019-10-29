function dy=vdp(t,y)
dy=[y(2);1000*(1-y(1)^2)*y(2)-y(1);];