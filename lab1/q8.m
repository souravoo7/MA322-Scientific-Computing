%part a
solve('5*(x^5)+3*(x^3)+x')
%part b
solve('(x^9)+x-9')
%part c
syms x
syms y
syms z
S=solve('3*x+5*y+7*z-9,x-8*y+2*z-20,7*x+2*y-9*z+2');
b=[S.x,S.y,S.z];
display(b);
%part d
D=solve('12*x-8*z-5,x+2*y+z-11,9*y+19*z-39');
d=[D.x,D.y,D.z];
display(d);