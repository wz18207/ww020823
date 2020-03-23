%%
clear;
close all;
clc;
t1=clock;
%%
data_g = load('6.pcd');     % 导入face1的点集
Error=[];
%R_only={1,360};
diary log.txt
for i=1:360
data_p = rotate(data_g, i);    % 将face1的点集向上旋转20度，表示为face2
save_3d_data('6.txt', data_p);

%plot_3d_2(data_g, data_p, -90); % 显示出当前两个点集

%%
[ data_g, data_p, error, data_pp, R ] = icp_process( data_g, data_p );
log_info(strcat('迭代次数：1，误差：', num2str(error)));
log_info('当前旋转矩阵为：');
disp(R);

cnt = 1;
last_error = 0;
last_R = R;
Error=[Error,error];
% 当误差收敛时，停止循环
while abs(error - last_error) > 0.01
    cnt = cnt + 1;
    last_error = error;
    last_R = R;
    [ data_g, data_p, error, data_pp, R ] = icp_process( data_g, data_p );
    R = last_R * R;
    log_info(strcat('迭代次数：', num2str(cnt), '，误差：', num2str(error)));
    %=[Error,num2str(error)];
    log_info('当前旋转矩阵为：');
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
% log_info(strcat('迭代次数：1，误差：', num2str(error)));
% log_info('当前旋转矩阵为：');
% disp(R);

% cnt = 1;
% last_error = 0;
% last_R = R;
% % 当误差收敛时，停止循环
% while abs(error - last_error) > 0.01
%     cnt = cnt + 1;
%     last_error = error;
%     last_R = R;
%     [ data_g, data_q, error, data_qq, R ] = icp_process( data_g, data_q );
%     R = last_R * R;
%     log_info(strcat('迭代次数：', num2str(cnt), '，误差：', num2str(error)));
%     log_info('当前旋转矩阵为：');
%     disp(R);
% end
% 
% plot_3d_2(data_g, data_q, -90);
