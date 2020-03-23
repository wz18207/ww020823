clc,clear
RedWine =  xlsread('问题3相关数据.xls',5,'B3:H29');
RedScore = [68.1 74 74.6 71.2 72.1 66.3 65.3 66 78.2 68.8 61.6 68.3 68.8 72.6 65.7 69.9 74.5 65.4 72.6 75.8 72.2 71.6 77.1 71.5 68.2 72 71.5]';
%红酒第二组的葡萄酒质量(总评得分)

%对红葡萄酒理化指标与葡萄酒质量(得分)归一化
for j = 1:7
    for i=1:27
        MAX = max(RedWine(:,j));
        MIN = min(RedWine(:,j));
        RedWine(i,j) = (RedWine(i,j) - MIN)/(MAX - MIN);
    end
end
RedScore = (RedScore - min(RedScore))/(max(RedScore) - min(RedScore));

%求红葡萄酒质量与红葡萄酒指标之间的多元回归系数
x = RedWine;
y = RedScore;
x1=[ones(size(x,1),1) x];
[b1,bint,r,rint,stats1] = regress(y,x1);
b1%红葡萄酒质量与白葡萄酒指标之间的多元回归系数
stats1%相应的R-square、F值、p值检验

WhiteWine =  xlsread('问题3相关数据.xls',6,'C3:H30');
WhiteScore = [77.9 75.8 75.6 76.9 81.5 75.5 74.2 72.3 80.4 79.8 71.4 72.4 73.9 77.1 78.4 67.3 80.3 76.7 76.4 76.6 79.2 79.4 77.4 76.1 79.5 74.3 77 79.6 ]';
%白酒第二组的葡萄酒质量(总评得分)

%对白葡萄酒理化指标与葡萄酒质量(得分)归一化
for j = 1:6
    for i=1:28
        MAX = max(WhiteWine(:,j));
        MIN = min(WhiteWine(:,j));
        WhiteWine(i,j) = (WhiteWine(i,j) - MIN)/(MAX - MIN);
    end
end

WhiteScore = (WhiteScore - min(WhiteScore))/(max(WhiteScore) - min(WhiteScore));

%求白葡萄酒质量与白葡萄酒指标之间的多元回归系数
x = WhiteWine;
y = WhiteScore;
x1=[ones(size(x,1),1) x];
[b2,bint,r,rint,stats2] = regress(y,x1);
b2%白葡萄酒质量与白葡萄酒指标之间的多元回归系数
stats2%相应的R-square、F值、p值

