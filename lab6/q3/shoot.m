% given BVP y"=f(x,y,y')
%convert this into a system of first order equations
% variables: x->x0;y->x1;y'->x2;
% by proper substitution we get the following system
% x0'=1
% x1'=x2
% x2'=exp(x)+x1*cos(x)-(x+1)*x2
% given boundary conditions: x1(0)=1, x1(1)=3;
h=0.01;
x1=1;
x2=2;%initial guess(shoot)
Y=[x1;x2];
%Applying Runge-Kutta 4/5
xi=0;
xf=1;
N=(xf-xi)/h;
n=0;%giving the time points
S=zeros(2,N+1);
p=1;
S(:,p)=Y;
while(n<=1 && p<=N+1)
    p=p+1;
    F1=h*F(n,x1,x2);
    F2=h*F(n,x1+F1(1,1)*0.5,x2+F1(2,1)*0.5);
    F3=h*F(n,x1+F2(1,1)*0.5,x2+F2(2,1)*0.5);
    F4=h*F(n,x1+F3(1,1),x2+F3(2,1));
    Y=Y+(1/6)*(F1+2*F2+2*F3+F4);
    S(:,p)=Y;
    n=n+h;
end
display('expected value at boundary');
S(1,end)
plot(S(1,:));


