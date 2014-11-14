function [y] = newton_nls (f, v, x0, n)

J = jacobian(f, v);
for i=1:n
    x0 = x0-subs(J, v, x0)\subs(f, v, x0);
end
y = x0;