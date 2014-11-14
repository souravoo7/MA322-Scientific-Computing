%Elliptic PDE using Gauss-Siedel Iterative Method
%u/xx + u/yy = f(x,y)

format long; clear all; clc;
%domain conditions
span = [1 2];
%boundary conditions
syms x y;
ux1 = exp(x);
ux2 = exp(2*x);
u1y = exp(y);
u2y = exp(2*y);
f = (x*x + y*y)*exp(x*y);
%step sizes
h = 0.2;
k = 0.1;
%number of iterations
M = 100;

n_r = (span(2) - span(1))/h;
n_c = (span(2) - span(1))/k;

%solution matrix
sol = zeros(n_r+1, n_c+1);

%store boundary conditions into the solution matrix
for i=1:n_r+1
    sol(i,1) = subs(ux1, span(1)+(i-1)*h);
    sol(i,n_c+1) = subs(ux2, span(1)+(i-1)*h);
end
for i=1:n_c+1
    sol(1,i) = subs(u1y, span(1)+(i-1)*k);
    sol(n_r+1,i) = subs(u2y, span(1)+(i-1)*k);
end

%Gauss-Seidel iterations
lambda = h^2/k^2;
for r = 1:M
    for i=2:n_r
        for j=2:n_c
            sol(i,j) = (sol(i+1,j) + sol(i-1,j) + lambda*sol(i,j+1) + lambda*sol(i,j-1)...
                - h*h*subs(f, [x, y], [span(1)+(i-1)*h, span(1)+(j-1)*k]))/(2+2*lambda);
        end
    end
end

figure
surf(sol)
title('Numerical Solution')

%actual solution
u = exp(x*y);
exact = eval(subs(subs(u, 'y', span(1):k:span(2)), [span(1):h:span(2)]'));
figure
surf(exact)
title('Exact Solution')

d = abs(exact-sol);
figure
surf(d)
title('Absolute Difference')