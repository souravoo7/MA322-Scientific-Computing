%clamped cuubic spline interpolation
format long;
x=[0.1,0.2,0.3,0.4];
f=[-0.62049958,-0.28398668,0.00660095,0.24842440];
display('clamped spline interpolation at x=0.2013');
spline(x,[0 f 0],0.2013)%using the clamped cubic spline interpolation function