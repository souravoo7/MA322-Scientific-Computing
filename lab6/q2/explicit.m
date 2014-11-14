%explicit euler-method
%a==0
%b=1
%N is the number of steps
function[r]=explicit(a,b,N)
    h=(b-a)/N;
    t=[a:h:b];
    y=1;
    i=1;
    r=zeros(1,N);
    while(i<=N)
        r(i)=y;
        y=y+h*fa(t(i),y);
        i=i+1;        
    end    
    return
end