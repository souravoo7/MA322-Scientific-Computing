function F = divided_diff(x,y,x0)

%divided_diff(x,y,x0) computes the divided differences table based on the n points
%with coordinates (x,y). 
%Those divided differences are needed to construct the (n-1)th Lagrange polynomial
%using the Newton's interpolatory divided difference formula
%n is the number of points, hence the interpolatory polynomial has degree n-1
%x0 is point for which we want an approximation of f(x0) based on the polynomial

%This file was generated after following a course in applied numerical methods
%at the University of Pretoria, Department of Geology, Geophysics division.
%The polynomial evaluation was taken from the book of John H. Mathews, Numerical
%Methods for Mathematics, Science and Engineering, 2nd Ed.

%Author: Alain G. Kapitho
%Date  : Dec. 2005


%getting the number of points from the x-vector
n = size(x,1);
if n == 1
   n = size(x,2);
end


%the 1st column in the divided differences table
for i = 1:n
   F(i,1) = y(i);
end

%the rest of the entries in the table
for i = 2:n
   for j = 2:i
      F(i,j)=(F(i,j-1)-F(i-1,j-1))/(x(i)-x(i-j+1));
   end
end



%evaluating the polynomial at the specified point
fx0 = F(n,n);
for i = n-1:-1:1
   fx0 = fx0*(x0-x(i)) + F(i,i);
end


%visualization of the data set
plot(x,y,'b*')
hold on
plot(x,y)
hold on
plot(x0, fx0, 'r.')


%command window outputs
disp('Point x0 where approximation of f(x0) is needed')
x0
disp('Evaluation of the polynomial at the specified point yields')
fx0
disp('Divided-differences table')
