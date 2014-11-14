x=[0.0:0.1:1.2];
y=zeros(1,12);
n=1;
while(n<=13)
    y(n)=fyy2(x(n));
    % change the function to vary results
    n=n+1;
end
display(y);
y1=(cos(x));
display(y1);
plot(x,y,'b',x,y1,'r')