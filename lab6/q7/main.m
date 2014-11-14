%parabolic equations
% discretize the domain
% u(x,0)=g(x)=(x-x^2)*exp(x)
g=inline('sin(pi*x)');
M=50;%the number of time points
N=20;%the number of space points
h=1/(N-1);%space interval
t=[0:1:M-1];%the time domain
x=[0:h:1];% the x axis
U=zeros(M,N);%initializing the solution matrix 
%--------------------------------------------------------------------------
%explicit method for parabolic equations
%--------------------------------------------------------------------------

n=1;
while(n<21)
    U(1,n)=g(x(n));
    n=n+1;
end
%the boundary conditions specified any other additional boudary conditions
%can also be added following this is necessary. Since we already
%initialized the matrix with zeros there is currently no need to do so.
k=1;% the time interval
s=k/(h*h);
n=2;
while(n<51)
    m=2;
    while(m<=19)
        U(n,m)=(s*(U(n-1,m-1)+U(n-1,m+1)-2*U(n-1,m)))+U(n-1,m);
        m=m+1;
    end
    n=n+1;
end
%output image settings
lighting phong
set(gcf,'Renderer','zbuffer')
%surf(x,t,U);
%hold on
%--------------------------------------------------------------------------
%implicit method for parabolic equations
%--------------------------------------------------------------------------
n=1;% giving the boundary conditions
while(n<21)
    U(1,n)=g(x(n));
    n=n+1;
end
%the boundary conditions specified any other additional boudary conditions
%can also be added following this is necessary. Since we already
%initialized the matrix with zeros there is currently no need to do so.
k=1;% the time interval
s=k/(h*h);% the s value
%contructing the tridiagonal matrix
d=zeros(1,N);
d1=zeros(1,N-1);
n=1;
while(n<=N)
    d(n)=1+2*s;
    n=n+1;
end
n=1;
while(n<=N-1)
    d1(n)=-s;
    n=n+1;
end
A=gallery('tridiag',d1,d,d1);
n=2;
while(n<=M)
    U(n,:)=A\transpose(U(n-1,:));
    n=n+1;
end
%surf(x,t,U);
%--------------------------------------------------------------------------
% the Crank-Nicholson Method
%--------------------------------------------------------------------------
g1=inline('0');
g2=inline('0');
a=1;
fString=inline('v+o');
[x,t,U]=Crank_Nicolson( g,fString , a, N, M,g1,g2 );
surf(t,x,U);