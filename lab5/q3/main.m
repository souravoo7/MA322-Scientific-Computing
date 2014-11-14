syms x;
y=(11*x^4)/4 - x^5/5 - (79*x^3)/6 + (97*x^2)/4 - (349*x)/30 + 2;
%this is the interpolated polynomial
a=[0:1:5];
y1=diff(y);
%here we get the acceleration by differentialting the function
y2=int(y,x)+4;
%here we get the position by integrating the function
plot(a,subs(y,a),a,subs(y1,a),a,subs(y2,a));