function [k]=F(x,x1,x2)
    k=[x2;exp(x)+x1*cos(x)-(x+1)*x2];
end