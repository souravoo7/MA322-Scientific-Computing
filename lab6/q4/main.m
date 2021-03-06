%using central differences
h=1/400;
N=1/h;
x=[0:h:1];
a=zeros(1,N+1);
b=zeros(1,N+1);
c=zeros(1,N+1);
d=zeros(1,N+1);
n=1;
%generating all the matrix elements of the tridiagonal system
% note that the realtions used below have been derived taking into
% consideration the given linear differential equation
while(n<=N+1)
    a(n)=-1-(h*(-2)/2);
    b(n)=-(h^2)*x(n);
    c(n)=-1+(h*(-2)/2);
    d(n)=2+(h*h)*(-1);
    n=n+1;
end
y=zeros(1,N+2);% the solution matrix
y(1)=0;
y(N+2)=0;% these initial values are known
% now build the matrix 
% it gets really tricky here however there is a function in built in MATLAB
% but using it would require some modifications
a1=zeros(1,N);n=1;
c1=zeros(1,N);
while(n<=N)
    a1(n)=a(n+1);
    c1(n)=c(n);
    n=n+1;
end
% using these matrices d,a1,c1 we built the tridiagonal system
A=gallery('tridiag',a1,d,c1);% A is the tridiagonal matrix
B=zeros(N+1,1);n=1;
while(n<=N+1)
    B(n,1)=b(n);
    n=n+1;
end
g=zeros(N+1,1);
g=A\B;%solving the equation
n=2;
while(n<=N+1)
    y(n)=g(n);
    n=n+1;
end
z=[0:1/(N+1):1];
plot(z,y);
