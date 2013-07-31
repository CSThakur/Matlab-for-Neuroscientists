function f = ode_euler(fhandle, x, f_o, param)
%This function takes two arguments, x which is a vector that specifies that
%time points that the function f should be approximated for, and f_o is 
%the initial %condition. For the example in Eq. 13, x=0:0.1:10, 
%so that delta_x is 0.1 and %f_o=1. It returns a vector f 
%representing the approximate solution to the differential equation, 
%df/dx=2x with f(0)=f_o. 

%Set delta_x as the difference between successive x values.
delta_x=x(2)-x(1);

%Determine how many points we need to approximate by finding the length of 
%vector x.
l_x=length(x);

%Initialize f by creating a vector of the right length. We will reset the 
%elements to the correct values in the for loop below.
f=zeros(1, l_x);

%Set the initial value of f to f_o.
f(1)=f_o;

%Use a for-loop to implement Eq. 12
for i=1:(l_x-1)
    %f(i+1)=f(i) + delta_x*feval(fhandle, x(i), param);
     f(i+1)=f(i) + delta_x*feval(fhandle, f(i), param);
end;
