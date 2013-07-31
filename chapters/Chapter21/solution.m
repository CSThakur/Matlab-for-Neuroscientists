function [x, y] = solution(A, init)
%Init should be expressed as a row vector. init=[-2 -2];

%Problem 1 
  %The initial condition in the new coordinate system is (-2,-2) becuase if
  %C~ = C - L/(k+1) then C~=0-10/5=0-2=-2;
%Problem 2
  %For this lab the matrix A should be [-1/Tc, -k/Tc; 1/Th, -1/Th];
  %where k=4, Tc=0.025, and Th=0.08, so in daylight 
  %A=[-40, -160; 12.5, -12.5]; and at night
  %A=[-10, -5; 2, -2];
  
  [V, D] = eig(A);
  D11 = D(1);
  D22 = D(4);
  init = init';
  if(D11 == D22)
      error('Matrix A does not have distict eigenvalues');
  else
      t = 0:0.01:4;
      c = inv(V)*init;
      x = c(1)*V(1,1).*exp(D11.*t) + c(2)*V(1,2).*exp(D22.*t);
      y = c(1)*V(2,1).*exp(D11.*t) + c(2)*V(2,2).*exp(D22.*t);
      plot(t, x);
      hold on;
      plot(t, y, 'r');
      title('Cones and Horizontal cell response');
  end
  
  %Note that this code produces a warning that imaginary parts of x and y
  %are being ignored. This is alright. Any imaginary parts are very small
  %and only the result of rounding errors in the calculations.
  
%%Problem 4  
  %%The cones respond more strongly to light, which is not surprising.