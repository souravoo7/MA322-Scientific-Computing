format long;
syms x1 x2 x3;
func = [x1^3-2*x2-2 ; x1^3-5*x3^2+7 ; x2*x3^2-1];
var = [x1, x2, x3];
x = [1; 1; 1];
y = newton_nls(func, var, x, 10);
disp(y);