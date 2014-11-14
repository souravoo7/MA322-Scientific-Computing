%solve the hyperbolic equation (u_x+u_t=0)
%u(x.0)=1 if x<0.5 else 0 
% the time points between [0,1]
M=50;
m=1/(M-1);
t=[0:m:1];
%the number of space points between [0,1]
N=40;
n=1/(N-1);
x=[0:n:1];
%defining the solution matrix
U=zeros(M,N);
i=1;
while(i<=N)
    if(x(i)<=0.5)
        U(1,i)=1;
    else
        U(1,i)=0;
    end
    i=i+1;
end
% boundary conditions defined
%remaining boundary conditions is necessary can be defined here
%Assumption: the u(0,t)=u(1,t)=0;
s=(-1*m)/(2*n);
i=2;
while(i<M)
    j=2;
    while(j<=N-1)
        U(i,j)=((2*s*s)+s)*U(i-1,j+1)+(1-(4*s*s))*U(i-1,j)+((2*s*s)-s)*U(i-1,j-1);
        j=j+1;
    end
    i=i+1;
end                 
surf(x,t,U);