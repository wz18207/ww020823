function[A]=T_SORT(A,n,p)
%T_SORT(A,n,p)
%A ���ݵ�n������
%p=1 ����2��
SIZE=size(A);
if p == 1
    [xx,idx]=sort(A(n,:));
    for i=1:SIZE(1)
        A(i,:)=A(i,idx);
    end
elseif p ==2
    [xx,idx]=sort(A(n,:),'descend');%����
    for i=1:SIZE(1)
        A(i,:)=A(i,idx);
    end
end
    