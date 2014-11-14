function [t,r]=rungekutta(x0,xf,N)
f=inline('sin(t)-y');
h=(xf-x0)/N;%step size
x=0;%initial condition
y=1;%initial condition
n=1;
r=zeros(1,N+1);
t=[x0:h:xf];
while(n<=N+1)
    r(n)=y;
    k1=h*f(x,y);
    k2=h*f(h/2+x,k1/2+y);
    k3=h*f(h/2+x,k2/2+y);
    k4=h*f(x+h,y+k3);
    y=y+((k1+2*k2+2*k3+k4)/6);
    x=x+h;
    n=n+1;
end
end
