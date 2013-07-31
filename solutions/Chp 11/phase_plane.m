function stable = phase_plane(A, init)
  
%Exercise 11.3.1.
  %The initial condition in the new coordinate system is (-2,-2) becuase if
  %C~ = C - L/(k+1) then C~=0-10/5=0-2=-2;
  
  %Note for project 11.4 the matrix A should be [-1/Tc, -k/Tc; 1/Th, -1/Th];
  %where k=4, Tc=0.025, and Th=0.08, so in daylight 
  %A=[-40, -160; 12.5, -12.5]; and at night
  %A=[-10, -5; 2, -2];

%Define axes
x = -10:.5:10;
y = x;
%Create nullclines
  xnull = -A(1)/A(2).*x;
  ynull = -A(3)/A(4).*x;
%Find eigenvalues for classifying fixed point
eigval = eig(A);
lam1 = eigval(1);
lam2 = eigval(2);
%Classify the fixed point
if ((isreal(lam1) && isreal(lam2)) && (lam1~=lam2))
  if(lam1 < 0 && lam2 < 0)
      stable = 'nodal sink';
  elseif (lam1 > 0 && lam2 > 0)
      stable = 'nodal source';
  elseif ((lam1 < 0 && lam2 > 0) || (lam1 > 0 && lam2 < 0))
      stable = 'saddle point';
  end;
elseif(imag(lam1)~=0)
  if(real(lam1) < 0)
    stable = 'spiral sink';
  elseif(real(lam1) > 0)
    stable = 'spiral source';
  end;
else
    stable = 'nongeneric';
end;

[X, Y] = meshgrid(x,y);
%Create the vectors to be plotted
u=A(1,1)*X+A(1,2)*Y;
v=A(2,1)*X+A(2,2)*Y;
%Plot the vector field.
quiver(X, Y, u, v);
hold on;
plot(x, xnull, 'k');
plot(x, ynull, 'r');
axis([-4, 4, -4, 4]);
title('Phase Plane of 2D Linear System');
xlabel('x');
ylabel('y');
%Calculate trajectory
delta_dist = 0.1;
%deltay = deltax;
n_points = 800;
x1 = zeros(n_points, 1);
y1 = x1;
x1(1) = init(1);
y1(1) = init(2);

%The code below finds the trajectories of the system by following the
%arrows indicated by the vector field. As the trajectory approaches the
%origin, the method begins to break down. Better trajectories can be
%obtained using either ode-euler or RK4, but since the code for both of
%these algorithms appears later in chapter 19, I used this last method hear
%to expose the reader to a broader selection of alternatives for
%implementing the trajectory calculation. Don't worry that these
%trajectories do not converge on the origin explicitly. We will be using a
%more professional piece of code for doing phase plane analysis in the next
%chapter.

%Start at the initial point and find the unit vector pointing parallel 
%to the vector field at the initial point. Move in this direction
%a distance of delta_x to a new point. Repeat this process for 1000 points.
for i=2:n_points
    dir_x = A(1)*x1(i-1)+A(3)*y1(i-1);
    dir_y = A(2)*x1(i-1)+A(4)*y1(i-1);
    N = sqrt((dir_x)^2 + (dir_y)^2);
    if (N == 0) 
    x1(i) = x1(i-1);
    y1(i) = y1(i-1);
    else    
    dir_x = dir_x/N;
    dir_y = dir_y/N;    
    x1(i) = x1(i-1) + delta_dist*dir_x;
    y1(i) = y1(i-1) + delta_dist*dir_y;
    end;
end;
plot(x1, y1, 'g');
hold off;
%%Project 11.4
  %%With daylight parameters, the fixed point behaves as a spiral sink;
  %%With night time parameters the system behaves as a nodal sink;
 
