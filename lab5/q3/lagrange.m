function [r]=lagrange()
%enter the data points for x,y in the two following vectors
x1=[0,1,2,3,4,5];
y1=[2,4,8,4,0,-2];
syms x;
%also change the data point numbers
n=6;
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