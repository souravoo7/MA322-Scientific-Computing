function [r]=q9(n)
    f=1;
    s=0;
    while(f<n+1)
        s=s+(1/f);
        f=f+1;
    end
    r=s;
    return
end