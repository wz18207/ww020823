 TotleUD=zeros(3,208);
 TotleLR=zeros(3,208);
 Up_H=zeros(2,208);
 Dw_H=zeros(2,208);
 L_H=zeros(2,208);
 R_H=zeros(2,208);
 A=imread( 'E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\003.bmp');
 [m,n]=size(A);
 temp=ones(1,n)*255;
 temp1=ones(m,1)*255;
 for i=1:209
 Up_height=0;
 Dw_height=0;
 L_height=0;
 R_height=0;
 if i<11
 str=strcat( 'E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\00',num2str(i-1),'.bmp');
 elseif i>=11&&i<101
 str=strcat( 'E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\0',num2str(i-1),'.bmp');
 else 
 str=strcat( 'E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\',num2str(i-1),'.bmp');
 end
 a=imread(str);
  %�����Ϸ��߶�
 k=1;
 while a(k,:)==temp
 Up_height=Up_height+1;
 k=k+1;
 end
  %�����·��߶�
 x=m;
 while x~=0&a(x,:)==temp
 Dw_height=Dw_height+1;
 x=x-1;
 end
  %������߸߶�
 for j=1:n
 if a(:,j)==temp1
 L_height=L_height+1;
 else
 break;
 end
 end
 j=n;
 while j~=0&a(:,j)==temp1;
 R_height=R_height+1;
 j=j-1;
 end
 Dw_H(1,i)=i-1;
 Dw_H(2,i)=Dw_height;
 Up_H(1,i)=i-1;
 Up_H(2,i)=Up_height;
 L_H(1,i)=i-1;
 L_H(2,i)=L_height;
 R_H(1,i)=R_height;
 R_H(2,i)=R_height;
 TotleUD(1,i)=i-1;
 TotleUD(2,i)=Up_height;
 TotleUD(3,i)=Dw_height;
 TotleLR(1,i)=i-1;
 TotleLR(2,i)=L_height;
 TotleLR(3,i)=R_height;
 end
 TotleUD;
 TotleLR;
  xlswrite('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\���±߽�.xls',TotleUD);
  xlswrite('E:\��ѧ����\2019�������ģ\Text 2019.8.5\cumcm2013\B\����3\���ұ߽�.xls',TotleLR); 