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
]; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5 ��ȡ���и����е�ͼƬ
%��ȡ����1�е�ͼ��
n = 19;
image_name = strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����1','/',image_num,'.bmp');%ƴ��ͼ���ַ������
for j = 1:n
    image_1(:,:,j) = imread(image_name(j,:));%��ͼ��������
end
save image_1 image_1;%����1ͼ��
%��ȡ����2�е�ͼ��
n = 19;
image_name = strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����2','/',image_num,'.bmp');%ƴ��ͼ���ַ������
for j = 1:n
    image_2(:,:,j) = imread(image_name(j,:));%��ͼ��������
end
save image_2 image_2;%����2ͼ��
%��ȡ����3�е�ͼ��
n = 209;
image_name = strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3','/',image_num,'.bmp');%ƴ��ͼ���ַ������
for j = 1:n
    image_3(:,:,j) = imread(image_name(j,:));%��ͼ��������
end
save image_3 image_3;%����3ͼ��
%��ȡ����4�е�ͼ��
n = 209;
image_name = strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����4','/',image_num,'.bmp');%ƴ��ͼ���ַ������
for j = 1:n
    image_4(:,:,j) = imread(image_name(j,:));%��ͼ��������
end
save image_4 image_4;%����4ͼ��
%��ȡ����5 a �е�ͼ��
n = 209;
image_name = strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����5','/',image_num,'a','.bmp');%ƴ��ͼ���ַ������for j = 1:n
image_5a(:,:,j) = imread(image_name(j,:));%��ͼ��������
save image_5a image_5a;%����5aͼ��
%��ȡ����5 b �е�ͼ��
n = 209;
image_name = strcat('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����5','/',image_num,'b','.bmp');%ƴ��ͼ���ַ������for j = 1:n
image_5b(:,:,j) = imread(image_name(j,:));%��ͼ��������
save image_5b image_5b;%����5aͼ��