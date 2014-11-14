function [wi, ti] = ab2 ( RHS, t0, x0, tf, N )

neqn = length ( x0 );
ti = linspace ( t0, tf, N+1 );
wi = [ zeros( neqn, N+1 ) ];
wi(1:neqn, 1) = x0';

h = ( tf - t0 ) / N;

%
%  generate w1 using the optimal RK2 method  
%

fold = feval ( RHS, t0, x0 );
xtilde = x0 + (2*h/3) * fold;
x0 = x0 + (h/4) * fold + (3*h/4) * feval ( RHS, t0 + (2*h/3), xtilde );
t0 = t0 + h;
wi(1:neqn,2) = x0';

	
%
%  perform remaining time steps using 2-step Adams Bashforth method
%

for i = 2:N
    fnew = feval ( RHS, t0, x0 );
    x0 = x0 + (3*h/2) * fnew - h/2 * fold;
	t0 = t0 + h;
	fold = fnew;

    wi(1:neqn,i+1) = x0';	
end;
