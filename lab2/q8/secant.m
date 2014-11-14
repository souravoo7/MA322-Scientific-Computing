function [r]=secant(a,b,N,epsilon)
    c=b;
    p=a;
    n=1;
    while(abs(f(c))>epsilon && n<N)
        x=c-(f(c)*(c-p)/(f(c)-f(p)));
        p=c;
        c=x;
        n=n+1;
    end
    r=c;
    return
end