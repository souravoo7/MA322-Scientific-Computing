%define the vector a containing the data points
%define the variables high and low signifying the limits
%--------------------------------------------------------------------------
%            Trapezoid Rule
%--------------------------------------------------------------------------
a=[0.5:0.001:1];
syms x
f=x^4;
k=subs(f,a);
display(trapz(a,k));
%--------------------------------------------------------------------------
%            Midpoint Rule
%--------------------------------------------------------------------------
low=0.5;
high=1;
b=[low:(high-low)/13:high];%the composite rule data points are contained in here
z=low;
value=0;
while(z<high)
    value=value+((high-low)/13)*subs(f,((2*z)+((high-low)/13))/2);
    z=z+((high-low)/13);
end
display(value);
%--------------------------------------------------------------------------
%            Simpson's 1/3 Rule
%--------------------------------------------------------------------------
value=0;
z=low;
while(z<high)
    value=value+1/6*((high-low)/13)*(subs(f,z)+4*subs(f,((2*z)+((high-low)/13))/2)+subs(f,z+((high-low)/13)));
    z=z+((high-low)/13);
end
display(value);
%--------------------------------------------------------------------------
%            Simpson's 3/8 Rule
%--------------------------------------------------------------------------
value=0;
z=2;
l=((high-low)/(13));%step size
j=subs(f,b);%contains the function values at the fourteen points(13 intervals)
while(z<12)%till n-1
    value=value+3*(j(z)+j(z+1));
    z=z+3;
end
z=4;
while(z<11)%till n-2
    value=value+2*j(z);
    z=z+3;
end
value=(3/8)*l*(value+j(1)+j(14));
display(value);
