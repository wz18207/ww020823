clear all;
clc
load('B_1');
load('B_2');
stop_start=input('please input the start stop:');
stop_final=input('please input the final stop:');
if(~isempty(find(B_1==stop_start)) && ~isempty(find(B_1==stop_final)))
    disp('����T1ֱ��')
    [x,y]=find(B_1==stop_start)
    [x1,y1]=find(B_1==stop_final)
end
if(~isempty(find(B_2==stop_start)) && ~isempty(find(B_2==stop_final)))
    disp('����T2ֱ��')
    [x,y]=find(B_2==stop_start)
    [x1,y1]=find(B_2==stop_final)
end
if(~isempty(find(B_1==stop_start)) && ~isempty(find(B_2==stop_final)))
    disp('����T1�ϳ�Ȼ�󻻳�T2���յ�վ')
    [x,y]=find(B_1==stop_start)
    [x1,y1]=find(B_2==stop_final)
end
if(~isempty(find(B_2==stop_start)) && ~isempty(find(B_1==stop_final)))
    disp('����T2�ϳ�Ȼ�󻻳�T1���յ�վ')
    [x,y]=find(B_2==stop_start)
    [x1,y1]=find(B_1==stop_final)
end
abs(x-x1)
