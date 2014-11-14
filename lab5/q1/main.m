%runcode once with h1=0.1 and once with h1=0.01
%make the appropriate changes in the loops and in line 7
h1=0.01;
syms x;
sf=exp(x);
a=[0:h1:1];
d=subs(sf,a);
sf=diff(sf);
d1=subs(sf,a);
%forward difference
z=1;
d2=zeros(1,101);
while(z<=101)
    d2(z)=(f(a(z)+h1)-f(a(z)))/h1;
    z=z+1;
end
%backward difference
z=1;
d3=zeros(1,101);
while(z<=101)
    d3(z)=(-f(a(z)-h1)+f(a(z)))/h1;
    z=z+1;
end
%centered difference
z=1;
d4=zeros(1,101);
while(z<=101)
    d4(z)=(f(a(z)+h1)-f(a(z)-h1))/(2*h1);
    z=z+1;
end
plot(a,d,a,d1,a,d2,a,d3,a,d4);
%--------------------------------------------------------------------------
% function g(x)=x^2*exp(-x)
%--------------------------------------------------------------------------
h1=0.1;
syms x;
sf=(x^2)*exp(-x);
a=[0:h1:1];
d=subs(sf,a);
sf=diff(sf);
d1=subs(sf,a);
%forward difference
z=1;
d2=zeros(1,11);
while(z<=11)
    d2(z)=(g(a(z)+h1)-g(a(z)))/h1;
    z=z+1;
end
%backward difference
z=1;
d3=zeros(1,11);
while(z<=11)
    d3(z)=(-g(a(z)-h1)+g(a(z)))/h1;
    z=z+1;
end
%centered difference
z=1;
d4=zeros(1,11);
while(z<=11)
    d4(z)=(g(a(z)+h1)-g(a(z)-h1))/(2*h1);
    z=z+1;
end
plot(a,d,a,d1,a,d2,a,d3,a,d4);
