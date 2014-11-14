
function [r] = bisection1(a,b,N,epsilon,distmin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% f=@(x)exp(x)-sin(x);
%function is defined here
if (f(a)==0)
    r=a;
    return;
elseif f(b)==0
    r=b;
    return;
end
if (f(a)*f(b))>0
    error('no root present');
end
n=0;c=0;
while(abs(f(c))~=0 && abs(a-b)>distmin && n<N && abs(f(c))>epsilon)
    c=(a+b)/2;n=n+1;
    if f(c)*f(b)<0
        a=c;
    else
        b=c;
    end
end
r=c;
return

end
