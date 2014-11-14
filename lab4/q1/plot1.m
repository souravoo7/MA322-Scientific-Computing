x=[0:0.01:5];
y=zeros(1,501);
c=1;
while(c<502)
    y(c)=f1(x(c));
    c=c+1;
end
plot(x,y);

