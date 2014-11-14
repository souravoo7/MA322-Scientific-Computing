%script/function file to use euler's implicit method of approximation
% solution to IVP
% define function in an external file
% (a,b) the domain in consideration
% ep is the tolerance value for the fixed point iteration
function [r]=implicit(a,b,N,ep)
   h=(b-a)/N;%step size calculated
   t=[a:h:b];
   i=1;
   y=1;%initial value
   r=zeros(1,N);
   while(i<N)
       %j=0;
       y2=0;
       y1=y+h*fa(t(i+1),y);
       while(abs(y1-y2)<=ep)
           y2=y1;
           y1=y1+h*fa(t(i+1),y1);           
       end
       y=y+h*fa(t(i),y1);
       r(i)=y;
       i=i+1;
   end
   return
end