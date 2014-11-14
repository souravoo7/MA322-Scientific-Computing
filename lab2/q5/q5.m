% xn+1=g(xn)
% g(x)=1/2*(x+3/x)
function [r]=q5(c,N,epsilon)
% c=1 as given
    x=c;
    n=1;
    while(n<N && abs(func(x))>epsilon)
        x=0.5*(x+(3/x));%x=g(x)
        display(x);
        n=n+1;
    end
    r=x;
    return
end