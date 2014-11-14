% xn+1=g(xn)
% g(x)=(1+x)^(1/3)
function [r]=q3(c,N,epsilon)
% c=1 as given
    x=c;
    n=1;
    while(n<N && abs(f(x))>epsilon)
        x=(1+x)^(1/3);%x=g(x)
        display(x);
        n=n+1;
    end
    r=x;
    return
end