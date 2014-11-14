a=[0:0.1:10];%defining the time axis
syms t;
v=(-0.011*t*t*t)-(0.2*t*t)+(2.4*t)+2;
s=int(v,t)+4;
ac=diff(v);
v1=subs(v,a);
s1=subs(s,a);
ac1=subs(ac,a);
% they contain the exact values
%using numeric defferentiation techniques (the forward scheme)
h=0.1;
z=1;
ac2=zeros(1,101);
while(z<=101)
    ac2(z)=(f(a(z)+h)-f(a(z)))/(h);
    z=z+1;
end
%using numeric integration techniques (using the simpson's one-third rule)
plot(a,v1,a,s1,a,ac1,a,ac2);
