clear;clc
m=1;n=1;q=1;
for k=0:208
    if k<10 
        t=strcat('00',int2str(k),'.bmp');
        a1{m}=jz01zh((imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\',t))));
        m=m+1;
    end
    if k>=10 && k<=99
        t=strcat('0',int2str(k),'.bmp');
        a2{n}=jz01zh((imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\',t))));
        n=n+1;
    end
    if k>=100
        t=strcat(int2str(k),'.bmp');
        a3{q}=jz01zh((imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\',t))));
        q=q+1;
    end    
end
a=[a1,a2,a3];
for k=1:209
    temp=a{k};
    [row col]=size(temp);
    br=temp(:,col);
    bt=temp(:,1);
    bu=temp(1,:);
    bd=temp(row,:);
    bound1{k}=[bt,br];
    bound2{k}=[bu',bd'];
end
