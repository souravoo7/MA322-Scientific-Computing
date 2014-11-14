function[y,t]=AM(N,ep,J)
f=inline('sin(t)-y');%f(t,y)
h=1/N;%step size
x=0;
y=1;
n=1;
s=zeros(1,4);
while(n<=4)
    s(n)=y;
    k1=h*f(x,y);
    k2=h*f(h/2+x,k1/2+y);
    k3=h*f(h/2+x,k2/2+y);
    k4=h*f(x+h,y+k3);
    y=y+((k1+2*k2+2*k3+k4)/6);
    x=x+h;
    n=n+1;
end
%s gives the initial four starting values
% t refers to the time points
t=[0:h:1];
y=zeros(1,N+1);
% buffering the values
y(1)=s(1);
y(2)=s(2);
y(3)=s(3);
y(4)=s(4);
n=4;
y1=0;
while(n<=N+1)
    y1=y(n-1)+(h/24)*(9*f(t(n),y(n))+19*f(t(n-1),y(n-1))-5*(f(t(n-2),y(n-2)))+f(t(n-3),y(n-3)));
    k=1;
    while(abs(y1-y(n))<ep && k<J)%ep is the iterative tolerance and the J is the max. iterations allowed
        k=k+1;
        y(n)=y1;
        y1=y(n-1)+(h/24)*(9*f(t(n),y(n))+19*f(t(n-1),y(n-1))-5*(f(t(n-2),y(n-2)))+f(t(n-3),y(n-3)));
    end
    y(n)=y1;
    n=n+1;
end
end