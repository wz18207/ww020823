clear all;
clc
load('B_1');
load('B_2');
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
if(~isempty(find(B_1==stop_start)) && ~isempty(find(B_1==stop_final)))
    disp('乘坐T1直达')
    [x,y]=find(B_1==stop_start)
    [x1,y1]=find(B_1==stop_final)
end
if(~isempty(find(B_2==stop_start)) && ~isempty(find(B_2==stop_final)))
    disp('乘坐T2直达')
    [x,y]=find(B_2==stop_start)
    [x1,y1]=find(B_2==stop_final)
end
if(~isempty(find(B_1==stop_start)) && ~isempty(find(B_2==stop_final)))
    disp('乘坐T1上车然后换乘T2到终点站')
    [x,y]=find(B_1==stop_start)
    [x1,y1]=find(B_2==stop_final)
end
if(~isempty(find(B_2==stop_start)) && ~isempty(find(B_1==stop_final)))
    disp('乘坐T2上车然后换乘T1到终点站')
    [x,y]=find(B_2==stop_start)
    [x1,y1]=find(B_1==stop_final)
end
abs(x-x1)
