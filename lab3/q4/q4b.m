function [r]=q4b()
%enter the data points for x,y in the two following vectors
x1=[0.0,0.4,0.8,1.2];
y1=[cos(x1(1)),cos(x1(2)),cos(x1(3)),cos(x1(4))];
syms x;
%also change the data point numbers
n=4;
f=1;
r=0;
while(f<=n)
    g=1;
    p=1;
    p=p*y1(f);
    while(g<=n)
        if(g~=f)
            p=p*(x-x1(g))/(x1(f)-x1(g));
        end
        g=g+1;
    end
    f=f+1;
    r=r+p;
end
r=expand(r);
return
end