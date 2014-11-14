function [r]=q10c(x,y)
    r=(exp(-x)*exp(sqrt(-1)*y))-sqrt(x^2+y^4);
    return
end