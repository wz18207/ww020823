clear all;clc
%导入数据(白葡萄酒)
%X1=xlsread('2012A_Table1.xls', 'T1_white_grape', 'D3:M282');
%X2=xlsread('2012A_Table1.xls', 'T2_white_grape', 'D3:M282');
%导入数据(红葡萄酒)
X1=xlsread('2012A_Table1.xls', 'T1_red_grape', 'D3:M272');
X2=xlsread('2012A_Table1.xls', 'T2_red_grape', 'D3:M272');
[m,n]=size(X1);
K=27;  %红葡萄酒
%K=28; %白葡萄酒
% 计算每个样品的总得分
for i=1:K
      for j=1:n
      SX1(i,j)=sum(X1(10*i-9:10*i,j));
      SX2(i,j)=sum(X2(10*i-9:10*i,j));
      end
      u0(i)=mean([SX1(i,:), SX2(i,:)]);
end
% 计算方差
for i=1:K
    SD1(i,:)=(SX1(i,:)-u0(i)).*(SX1(i,:)-u0(i));
    SD2(i,:)=(SX2(i,:)-u0(i)).*(SX2(i,:)-u0(i));
end
for i=1:K
    TSD(1,i)=sum(SD1(i,:));
    TSD(2,i)=sum(SD2(i,:));
end
t=1:K;
plot(t,TSD(1,:),'*k-',t,TSD(2,:),'ok--', 'LineWidth', 2)
set(gca,'linewidth',2);
legend('一组方差','二组方差')
xlabel('红葡萄酒样品编号'); ylabel('红葡萄酒评价方差');
TSD1=sum(TSD(1,:));
TSD2=sum(TSD(2,:));
%白酒
%disp(['一组对白葡萄酒总方差:' num2str(TSD1)]);
%disp(['二组对白葡萄酒总方差:' num2str(TSD2)]);
%红酒
disp(['一组对红葡萄酒总方差:' num2str(TSD1)]);
disp(['二组对红葡萄酒总方差:' num2str(TSD2)]);