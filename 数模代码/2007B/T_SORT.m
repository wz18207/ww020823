function[A]=T_SORT(A,n,p)
%T_SORT(A,n,p)
%A 根据第n行排序
%p=1 升序，2降
SIZE=size(A);
if p == 1
    [xx,idx]=sort(A(n,:));
    for i=1:SIZE(1)
        A(i,:)=A(i,idx);
    end
elseif p ==2
    [xx,idx]=sort(A(n,:),'descend');%倒叙
    for i=1:SIZE(1)
        A(i,:)=A(i,idx);
    end
end
    