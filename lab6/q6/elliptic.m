function [A] = elliptic(a,b,c,d,N)

h=(b-a)/N;
k=(d-c)/N;
x=a:h:b;
y=c:k:d;
length(x)
length(y)
n=N+1;
A=zeros(n^2,n^2);
B=zeros(n^2,1);
k=1;
while k<=n
    A(k,k)=1;
    B(k,1)=0;
    k=k+1;
end
indo=1;
while k <= (n*n - n)
    if mod(k,n)==1
        A(k,k)=1;
        B(k,1)=0;
    elseif mod(k,n)==0
        B(k,1)=y(indo);
        A(k,k)=1;
        indo=indo+1;
    else
        A(k,k)=-4;
        A(k,k+1)=1;
        A(k,k-1)=1;
        A(k,k-n)=1;
        A(k,k+n)=1;
        B(k,1)=0;
    end
    k=k+1;
end
ind=1;
k;%can veiw k
while k<=n*n
    A(k,k)=1;
    B(k,1)=x(ind);
    ind=ind+1;
    k=k+1;
end
S=A\B;
%spy(B);
index=1;
U=zeros(n,n);
for k=1:n
   for l=1:n
        U(k,l)=S(index);
        index=index+1;
   end
end
E=zeros(n,n);
for k=1:n
    for l=1:n
        E(k,l)=x(k)*y(l);
    end
end
Er=abs(U-E);
figure(1)
surfc(x,y,U);
figure(2)
surfc(x,y,E);
figure(3)
surfc(x,y,Er);




