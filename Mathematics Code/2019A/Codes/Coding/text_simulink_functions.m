clear all;clc;
load a_a.mat
load b_b.mat
a_a(1,:)=a_a(1,:)*10;
b_b(1,:)=b_b(1,:)/100;
plot(b_b,a_a)