function [r]=newtonsys()
    x=[0;1];
    f=[f1(x(1),x(2));f2(x(1),x(2))];
    F=[f11d(x(1),x(2)),f12d(x(1),x(2));f21d(x(1),x(2)),f22d(x(1),x(2))];
    n=1;
    while(n<9)
        %8 iterations
        n=n+1;
        F=inv(F);
        x=x-(F*f);
        f=[f1(x(1),x(2));f2(x(1),x(2))];
        F=[f11d(x(1),x(2)),f12d(x(1),x(2));f21d(x(1),x(2)),f22d(x(1),x(2))];
    end
    r=x;
    return
end