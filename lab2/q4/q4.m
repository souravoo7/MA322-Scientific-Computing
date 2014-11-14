function [r]=q4(c,A,epsilon)
%c is the starting point
%A the deployed constant
% epsilon the stopping constant
    disp(c);
while(abs(c-sqrt(A))>epsilon)
       c=(0.5*c)+(0.5*A/c);
       disp(c);
end
    r=c;
    return;
end