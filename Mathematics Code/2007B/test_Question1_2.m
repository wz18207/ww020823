load time.mat
load connection.mat
min1
%                               ����
if min1==inf
   b=inf(3957);
   for i=1:3957;
       if connection(start,i)>0&&start~=i
          for j=1:3957
               if connection(i,j)>0&&i~=j&&connection(j,last)>0
               b(i,j)=time(start,i)+time(i,j)+time(j,last);
               end
          end
       end
   end
                 min1=min(min(b));
               [q,w]=find(b==min1);
               disp('��������'),disp(line(start,q))
              disp('���˵�1�λ���վ��:'),disp(q)
              disp('��������'),disp(line(q,w))
              disp('���˵�2�λ���վ��:'),disp(w)
              disp('���������ִ��յ�'),disp(line(w,last))
               disp('��Ҫ���ʱ��Ϊ:'),disp(min1)
               if line(start,q)==0
                   sum1=1;
                   elseif (((time(start,q))/3)/10)<=2
                          sum1=1;
                   elseif (((time(start,q))/3)/10)<=4&(((time(start,q))/3)/10)>2
                          sum1=2;
                else sum1=3;
               end
                    if line(q,w)==0
                   sum2=1;
                   elseif (((time(q,w))/3)/10)<=2
                          sum2=1;
                   elseif (((time(q,w))/3)/10)<=4&(((time(q,w))/3)/10)>2
                          sum2=2;
                else sum2=3;
                    end
                    if line(w,last)==0
                   sum3=1;
                   elseif (((time(w,last))/3)/10)<=2
                          sum3=1;
                   elseif (((time(w,last))/3)/10)<=4&(((time(w,last))/3)/10)>2
                          sum3=2;
                else sum3=3;
                    end
                    disp('����Ҫ���ѣ�'),disp(sum1+sum2+sum3)
end
