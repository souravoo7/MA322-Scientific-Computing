function [r]=lagrange()
%enter the data points for x,y in the two following vectors
x1=[1,2,3,4,5,6,7,8];
y1=[11.6,16.2,16.8,13.5,7.3,4.2,11.4,15.8];
syms x;
%also change the data point numbers
n=8;
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