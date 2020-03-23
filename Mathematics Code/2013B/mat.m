for i=0:208
    if i<10
        t=strcat('00',int2str(i),'.bmp');
        cell{1,i+1}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\',t));
    elseif i>=10 && i<100
        t=strcat('0',int2str(i),'.bmp');
        cell{1,i+1}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\',t));
    elseif i>=100 && i<=208
         t=strcat(int2str(i),'.bmp');
        cell{1,i+1}=imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3\',t));
    end
end
save('E:\大学资料\2019年国赛数模\Text 2019.8.5\附件3.mat','cell');
