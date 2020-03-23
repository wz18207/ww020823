B_1=zeros(3957);
for i4=1:1040
   for j4=1:144
         if(B(i4,j4+1)==0)
           break;
         else
           m=B(i4,j4);
           n=B(i4,j4+1);
           B_1(m,n)=1;
   end
   end
end
B_1