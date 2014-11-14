%cubic spline interpolation
xx=[0.3:0.02:0.44];
syms j;
f=sin(j);
y=subs(f,xx);
k=spline(xx,y,0.3102);%function to calculate the spline interpolant at 0.3102
display('interpolant');
display(k);
display('error');
display((k-sin(0.3102)));