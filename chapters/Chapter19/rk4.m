function f = rk4(fhandle, x, f_o, param)

%Define the step size
delta_x = x(2)-x(1);
%Define the length of x
l_x = length(x);
%Initialize the output variable f. It should have the same length as x, so
%that for each value of x we can calculate f at that value.
f = zeros(1, l_x);
%Use the initial condition to set the value of f(0).
f(1) = f_o;
%Definie v1-v4. See eq.'s 19.30.
v1 = delta_x*feval(fhandle, f_o, param);
v2 = delta_x*feval(fhandle, (f_o + v1/2), param);
v3 = delta_x*feval(fhandle, (f_o + v2/2), param);
v4 = delta_x*feval(fhandle, (f_o + v3), param);
%Define the next value f(2).
f(2) = f(1) + 1/6*(v1 + 2*v2 + 2*v3 + v4);
%Use a for loop to iterate the RK eq.'s, and
%approximate the rest of the values of f over the domain x.
for i=3:l_x
    %Definie v1-v4
     v1 = delta_x*feval(fhandle, f(i-1), param);
     v2 = delta_x*feval(fhandle, (f(i-1) + v1/2), param);
     v3 = delta_x*feval(fhandle, (f(i-1) + v2/2), param);
     v4 = delta_x*feval(fhandle, (f(i-1) + v3), param);
     %Define the next value f(i).
     f(i) = f(i-1) + 1/6*(v1 + 2*v2 + 2*v3 + v4);
end;
