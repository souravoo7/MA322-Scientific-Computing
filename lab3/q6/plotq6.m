x1=[0.0,0.1,0.3,0.6,1.0];
x2=[0.0,0.1,0.3,0.6,1.0,1.1];
y=zeros(1,5);
y1=zeros(1,6);
n=1;
while(n<=5)
    y(n)=f61(x1(n));
    n=n+1;
end
n=1;
while(n<=6)
    y1(n)=f612(x2(n));
    n=n+1;
end
%display(y);
plot(x2,y1,'r',x1,y,'b');