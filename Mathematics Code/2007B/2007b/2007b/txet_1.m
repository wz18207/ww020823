x1=input('���������վ:');
y1=input('�������յ�վ:');
W=input('������ྭ��վ��ĸ���:');
        [i1,j1]=find(B==x1);
        [i2,j2]=find(B==y1);
        [m,n]=size(i1);
        [p,q]=size(i2);
        [vp,vb]=size(B);
            tto=0;
  %Ѱ�Ҳ����������յ����·
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
           %Ѱ��exx��eyy����ͬԪ�أ���ֵ��tq
           for i=1:mn
              for ig=1:mn
                 if exx(i)==eyy(ig)
                    iq=iq+1;
                    tq(iq)=exx(i);
                  end
               end
           end    
           %Ѱ��eyy��ezz����ͬԪ�أ���ֵ��tn
           for i=1:mn
            for ig=1:mn
             if ezz(i)==eyy(ig)
                ih=ih+1;
                tn(ih)=ezz(i);
              end
            end
           end
           if iq~=0&ih~=0   %eyy��exx��ezz���н���
             for di=1:iq
                wq=find(tq(di)==eyy);  %exx��eyy���ཻԪ����eyy�е�λ��
                for dh=1:ih
                    wh=find(tn(dh)==eyy); %ezz��eyy���ཻԪ����eyy�е�λ��
                    if wq<wh                             
                       Le=find(x1==a(i1(ex,n),:))-1;
                       Lf=find(eyy(wq)==a(i1(ex,n),:))-1;
                       %���վ�͵�һ��תվ���ڵ�һ����·�ϵ�λ��
                       Lg=find(eyy(wq)==a(uu(1,ey),:))-1;
                       Lh=find(eyy(wh)==a(uu(1,ey),:))-1;
                       %��תվ���ڵڶ���·�ϵ�λ��
                       Lj=find(eyy(wh)==a(i2(ez,q),:))-1;
                       Lk=find(y1==a(i2(ez,q),:))-1;
                       %�ڶ���תվ����յ�վ�ڵ�����·�ϵ�λ��
                       if Le<Lf&Lg<Lh&Lj<Lk&(Lf-Le+Lh-Lg+Lk-Lj)<35
                       disp('���վ��һ��תվ��ڶ���תվ���յ�վ�������ߵ�λ��')
                          weizhi=[Le,Lf,Lg,Lh,Lj,Lk]
                       disp('ת����վ������·��');
                          L=[a(i1(ex,n),1),a(uu(1,ey),1),a(i2(ez,q),1)]
                       disp('��תվ��');
                       zhongzhuan=[eyy(wq),eyy(wh)]
                       end
                      end
                end
             end
          end
        end 
    end
end
