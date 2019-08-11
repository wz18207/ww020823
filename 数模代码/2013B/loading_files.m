b = [ones(1,10);0 1 2 3 4 5 6 7 8 9]';
image_num= [
strcat( num2str(0*b(:,1)),num2str(0*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(0*b(:,1)),num2str(b(:,1)),num2str(b(:,2)) ),
strcat( num2str(0*b(:,1)),num2str(2*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(0*b(:,1)),num2str(3*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(0*b(:,1)),num2str(4*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(0*b(:,1)),num2str(5*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(0*b(:,1)),num2str(6*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(0*b(:,1)),num2str(7*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(0*b(:,1)),num2str(8*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(0*b(:,1)),num2str(9*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(b(:,1)),num2str(0*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(b(:,1)),num2str(b(:,1)),num2str(b(:,2)) ),
strcat( num2str(b(:,1)),num2str(2*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(b(:,1)),num2str(3*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(b(:,1)),num2str(4*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(b(:,1)),num2str(5*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(b(:,1)),num2str(6*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(b(:,1)),num2str(7*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(b(:,1)),num2str(8*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(b(:,1)),num2str(9*b(:,1)),num2str(b(:,2)) ),
strcat( num2str(2*b(:,1)),num2str(0*b(:,1)),num2str(b(:,2)) ),
]; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5 读取所有附件中的图片
%读取附件1中的图像
n = 19;
image_name = strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件1','/',image_num,'.bmp');%拼接图像地址和名字
for j = 1:n
    image_1(:,:,j) = imread(image_name(j,:));%将图像读入矩阵
end
save image_1 image_1;%附件1图像
%读取附件2中的图像
n = 19;
image_name = strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件2','/',image_num,'.bmp');%拼接图像地址和名字
for j = 1:n
    image_2(:,:,j) = imread(image_name(j,:));%将图像读入矩阵
end
save image_2 image_2;%附件2图像
%读取附件3中的图像
n = 209;
image_name = strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件3','/',image_num,'.bmp');%拼接图像地址和名字
for j = 1:n
    image_3(:,:,j) = imread(image_name(j,:));%将图像读入矩阵
end
save image_3 image_3;%附件3图像
%读取附件4中的图像
n = 209;
image_name = strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件4','/',image_num,'.bmp');%拼接图像地址和名字
for j = 1:n
    image_4(:,:,j) = imread(image_name(j,:));%将图像读入矩阵
end
save image_4 image_4;%附件4图像
%读取附件5 a 中的图像
n = 209;
image_name = strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件5','/',image_num,'a','.bmp');%拼接图像地址和名字for j = 1:n
image_5a(:,:,j) = imread(image_name(j,:));%将图像读入矩阵
save image_5a image_5a;%附件5a图像
%读取附件5 b 中的图像
n = 209;
image_name = strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件5','/',image_num,'b','.bmp');%拼接图像地址和名字for j = 1:n
image_5b(:,:,j) = imread(image_name(j,:));%将图像读入矩阵
save image_5b image_5b;%附件5a图像