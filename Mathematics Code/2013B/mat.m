for i=0:208
    if i<10
        t=strcat('00',int2str(i),'.bmp');
        cell{1,i+1}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\',t));
    elseif i>=10 && i<100
        t=strcat('0',int2str(i),'.bmp');
        cell{1,i+1}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\',t));
    elseif i>=100 && i<=208
         t=strcat(int2str(i),'.bmp');
        cell{1,i+1}=imread(strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\',t));
    end
end
save('E:\��ѧ����\2019�������ģ\Text 2019.8.5\����3.mat','cell');
