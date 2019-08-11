function ResultLine=sortTeam(R,R2L)
Indexs=R;
Result=zeros(length(R));
for i=1:length(R)
    for m=1:length(R)
        PercentCom(i,m)=R2L(R(i),R(m));
    end
end
PercentCom;
flag=zeros(1,length(R));
Root=1;
ResultLine=[1];
for i=1:length(R)
    [result,index]=max(PercentCom(Root,:));
    flag(Root)=1;
    PercentCom(Root,:)=0;
    PercentCom(:,Root)=0;
    flag(index)=1;
    ResultLine=[ResultLine index];
    Root=index;
    if sum(flag(:)==1)==length(R)
        break;
    end
end
for i=1:length(R)
    ResultLine(i)=R(ResultLine(i));
end

    