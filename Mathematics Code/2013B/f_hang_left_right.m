function [left_zi_chang right_zi_chang] = f_hang_left_right(image_hang)
%image_hang = image_1(106:146,:,1);%取行
[row col] = size(image_hang);
image_01 = image_hang>=200; %01化图形,0表示汉字，1表示背景
image_hang_he = sum(image_01,1);%对列求和%%%%%%%%%%%%%%%%%%%找汉字
hanzi_fa_zhi = row;%表示空格
kong_ge_chang = 3;% 空格的长度
hang_he_01 = image_hang_he == hanzi_fa_zhi;
if( hang_he_01(1) == 0 )%本行左边开头为汉字，统计汉字的长度
for i =1:col-kong_ge_chang
if( sum(hang_he_01(i:i+kong_ge_chang-1)) == kong_ge_chang )
break;
end
end
left_zi_chang = i - 1;
else
left_zi_chang = 0;
end
if(left_zi_chang > 41)
left_zi_chang = 0;
end
if( hang_he_01(col) == 0 )%本行结束为汉字，统计汉字的长度
for i =col:-1:kong_ge_chang
if( sum(hang_he_01(i-kong_ge_chang +1:i)) == kong_ge_chang ) break;
end
end
right_zi_chang = col - i;
else
right_zi_chang = 0;
end
if(right_zi_chang > 41)
right_zi_chang = 0;
end