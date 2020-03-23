clear all;clc;
d=[]; 
for t = 0:245
    if t >=0 && t <=20
        d_1=((11/20)*t+14)/10;
        d=[d,d_1];
    elseif t >20 && t <=200
        d_1=2.5;
        d=[d,d_1];
    elseif t>200 && t <=245
        d_1=((25+(440/9))-(11/45)*t)/10;
        d=[d,d_1];
    end
    i=i+1;
end
%disp(d)
[lie,hang]=size(d);
V=[];A_num=[];
V_0=(pi/3)*(tan(9)^2)*((((0.7/tan(9))+d(1,1))^2)-(0.7/(tan(9)))^3);
V_1=(pi/3)*(tan(9)^2)*((((0.7/tan(9))+d(1,2))^2)-(0.7/(tan(9)))^3);
V=[V,V_0,V_1+V_0];
for j=3:hang
    V_3=(pi/3)*(tan(9)^2)*((((0.7/tan(9))+d(1,j))^2)-(0.7/(tan(9)))^3);
    V_2=V_3+V(1,j-1);
    V=[V,V_2];
    j=j+1;
end
% for j=1:hang
%     V_1=(pi/3)*(tan(9)^2)*((((0.7/tan(9))+d(1,j))^2)-(0.7/(tan(9)))^3);
%     V=[V,V_1];
%     V_1=[];
%     j=j+1;
% end
% for k =1:246
%     A_num=[A_num,k];
%     k=k+1;
% end
disp(V)
plot(V,d)