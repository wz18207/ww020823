%%
clear;
close all;
clc;
t1=clock;
%%
data_g = load('6.pcd');     % ����face1�ĵ㼯
Error=[];
%R_only={1,360};
diary log.txt
for i=1:360
data_p = rotate(data_g, i);    % ��face1�ĵ㼯������ת20�ȣ���ʾΪface2
save_3d_data('6.txt', data_p);

%plot_3d_2(data_g, data_p, -90); % ��ʾ����ǰ�����㼯

%%
[ data_g, data_p, error, data_pp, R ] = icp_process( data_g, data_p );
log_info(strcat('����������1����', num2str(error)));
log_info('��ǰ��ת����Ϊ��');
disp(R);

cnt = 1;
last_error = 0;
last_R = R;
Error=[Error,error];
% ���������ʱ��ֹͣѭ��
while abs(error - last_error) > 0.01
    cnt = cnt + 1;
    last_error = error;
    last_R = R;
    [ data_g, data_p, error, data_pp, R ] = icp_process( data_g, data_p );
    R = last_R * R;
    log_info(strcat('����������', num2str(cnt), '����', num2str(error)));
    %=[Error,num2str(error)];
    log_info('��ǰ��ת����Ϊ��');
    %R_only{1,i}=R;
    disp(R);
end
t2=clock;
disp(etime(t1,t2))
% plot_3d_2(data_g, data_p, -90);

end
diary off 
%%
% data_g = load('face1.asc');
% data_q = load('face3.txt');
% 
% [ data_g, data_q, error, data_qq, R ] = icp_process( data_g, data_q );
% log_info(strcat('����������1����', num2str(error)));
% log_info('��ǰ��ת����Ϊ��');
% disp(R);

% cnt = 1;
% last_error = 0;
% last_R = R;
% % ���������ʱ��ֹͣѭ��
% while abs(error - last_error) > 0.01
%     cnt = cnt + 1;
%     last_error = error;
%     last_R = R;
%     [ data_g, data_q, error, data_qq, R ] = icp_process( data_g, data_q );
%     R = last_R * R;
%     log_info(strcat('����������', num2str(cnt), '����', num2str(error)));
%     log_info('��ǰ��ת����Ϊ��');
%     disp(R);
% end
% 
% plot_3d_2(data_g, data_q, -90);
