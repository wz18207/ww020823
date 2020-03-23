x1=input('请输入起点站:');
y1=input('请输入终点站:');
W=input('输入最多经过站点的个数:');
        [i1,j1]=find(B==x1);
        [i2,j2]=find(B==y1);
        [m,n]=size(i1);
        [p,q]=size(i2);
        [vp,vb]=size(B);
            tto=0;
  %寻找不包含起点和终点的线路
for iu=1:vp
    vc=B(iu,:);
    rpp=find(x1==vc);
    rpq=isempty(rpp);
    tpp=find(y1==vc);
    tpq=isempty(tpp);
    if rpq==1&tpq==1
        tto=tto+1;
        uu(tto)=iu;
     end
end 
for ey=1:size(uu,2)
    eyy=B(uu(1,ey),:);
   for ex=1:m
       exx=B(i1(ex,n),:);
       for ez=1:p
           ezz=B(i2(ez,q),:);
           mn=size(exx,2);
           iq=0;
           ih=0;
           %寻找exx和eyy的相同元素，赋值到tq
           for i=1:mn
              for ig=1:mn
                 if exx(i)==eyy(ig)
                    iq=iq+1;
                    tq(iq)=exx(i);
                  end
               end
           end    
           %寻找eyy和ezz的相同元素，赋值到tn
           for i=1:mn
            for ig=1:mn
             if ezz(i)==eyy(ig)
                ih=ih+1;
                tn(ih)=ezz(i);
              end
            end
           end
           if iq~=0&ih~=0   %eyy与exx，ezz都有交点
             for di=1:iq
                wq=find(tq(di)==eyy);  %exx与eyy的相交元素在eyy中的位置
                for dh=1:ih
                    wh=find(tn(dh)==eyy); %ezz与eyy的相交元素在eyy中的位置
                    if wq<wh                             
                       Le=find(x1==a(i1(ex,n),:))-1;
                       Lf=find(eyy(wq)==a(i1(ex,n),:))-1;
                       %起点站和第一个转站点在第一条线路上的位置
                       Lg=find(eyy(wq)==a(uu(1,ey),:))-1;
                       Lh=find(eyy(wh)==a(uu(1,ey),:))-1;
                       %中转站点在第二线路上的位置
                       Lj=find(eyy(wh)==a(i2(ez,q),:))-1;
                       Lk=find(y1==a(i2(ez,q),:))-1;
                       %第二个转站点和终点站在第三线路上的位置
                       if Le<Lf&Lg<Lh&Lj<Lk&(Lf-Le+Lh-Lg+Lk-Lj)<35
                       disp('起点站第一个转站点第二个转站点终点站在所在线的位置')
                          weizhi=[Le,Lf,Lg,Lh,Lj,Lk]
                       disp('转两次站经过的路线');
                          L=[a(i1(ex,n),1),a(uu(1,ey),1),a(i2(ez,q),1)]
                       disp('中转站点');
                       zhongzhuan=[eyy(wq),eyy(wh)]
                       end
                      end
                end
             end
          end
        end 
    end
end
