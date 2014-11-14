format long;
x = -0.1:0.1:1.1;
fx = log(1+x);
px = 0.02957206*x.^5 - 0.12895295*x.^4 + 0.28249626*x.^3 - 0.48907554*x.^2 + 0.99910735*x;
err = fx-px;
%plot(x,fx,'b',x,px,'r');
data = [fx; px; err]';
uitable('Data', data, 'ColumnName', {'f(x)', 'p(x)', 'error'});