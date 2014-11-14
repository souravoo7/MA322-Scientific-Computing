function [r]=q6l()
%enter the data points for x,y in the two following vectors
x1=[0.0,0.1,0.3,0.6,1.0];
y1=[-6.0,-5.89483,-5.65014,-5.17788,-4.28172];
syms x;
%also change the data point numbers
n=5;
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