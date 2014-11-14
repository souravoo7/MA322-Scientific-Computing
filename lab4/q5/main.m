t=[0,3,5,8,13];
s=[0,225,383,623,993];
display('natural cubic spline interpolation prediction is:');
a=spline(t,s,10);
a
display('clamped cubic spline interpolation prediction is:');
b=spline(t,[75 s 72],10);
b