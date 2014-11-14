function [r] = newton(c,N,epsilon)
%define a separate function f in a function file inline or separate
% define the same for the derivative of the function 
n=0;
while(abs(f(c))~=0 && abs(f(c))>epsilon)
    n=n+1;
    c=c-f(c)/f1(c);
end
if(n==N)
    error('not found in the given iterations');
end
r=c;
return
end
