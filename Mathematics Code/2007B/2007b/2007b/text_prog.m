clear all;
clc;
sjchuli;%�����ݴ���
longest_stops=0;%Ѱ�������·վ��
B=[];%��վ����Ϣ���������
for i=1:length(L2)
    c=L2{i,1:1};
  if (longest_stops<length(c))
      longest_stops=length(c);
      k=i;
  end
end
for i=1:length(L2)
    A=L2{i,1:1};
    A1=zeros(1,longest_stops-length(A));
    A=[A A1];
    B=[B;A];
end
B
disp(longest_stops)
disp(k)