%start with 2
%the function takes m,n as arguments try with (5,7)
%to obtain the given result in the question
function [r]=q12(m,n)
    d=zeros(m,n);
    i=1;
    j=1;
    f=2;
    while(i<=n)
        p=f;
        j=1;
        h=p;
        while(j<=m)
            d(j,i)=p;
            p=p+h;
            j=j+1;
        end
        f=f+3;
        i=i+1;
    end
    r=d;
    return
end