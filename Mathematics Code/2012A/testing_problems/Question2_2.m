
%*****************************************************
%问题2：求经过SPSS聚类分析后的评价等级
%*****************************************************

%聚类分组后的评价等级计算
clc,clear
score1=xlsread('问题1葡萄酒评分表.xls',5,'C2:C28');%第二组评酒师对红葡萄酒的评分
score2=xlsread('问题1葡萄酒评分表.xls',5,'E2:E29');%第二组评酒师对白葡萄酒的评分

%红葡萄酒的聚类分组
Zu11 = [10 25 20 19 13 12 23 8];
Zu12 = [11 26 27];
Zu13 = [9 1];
Zu14 = [2 16 4 24 22 5 6 21 14 17 3 18 15 7];

%白葡萄酒的聚类分组
Zu21 = [11 23 5 28 4 17];
Zu22 = [10 21 6 20 24 18 14 27 26 7];
Zu23 = [3 15 2 13 9 12];
Zu24 = [22 25 1 8];

aver_score1(1) = mean(score1(Zu11));
aver_score1(2) = mean(score1(Zu12));
aver_score1(3) = mean(score1(Zu13));
aver_score1(4) = mean(score1(Zu14));
aver_score2(1) = mean(score2(Zu21));
aver_score2(2) = mean(score2(Zu22));
aver_score2(3) = mean(score2(Zu23));
aver_score2(4) = mean(score2(Zu24));
aver_score1%显示红葡萄酒每组的得分均值
aver_score2%显示白葡萄酒每组的得分均值

