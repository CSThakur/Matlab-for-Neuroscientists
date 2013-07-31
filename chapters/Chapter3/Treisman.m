function outpt=Treisman(n, search, target)
%n=number of x's and o's you want plotted;
%search='c' or 'f'; 'c' means conjunctive search, 'f' means feature search
%target= 'y' or 'n' for presence of target in image;
%h=figure;
%pause
%h725=get(h,'CurrentCharacter');


x=rand(n, 1);
y=rand(n,1);

z=rand(2,1);
   if(z(1) <= 0.5)
      target_sym='X';
      not_target='O';  
   else
      target_sym='O';
      not_target='X';
   end;
   if(z(2) <= 0.5)
      target_col='r';
      not_col='g';
   else
      target_col='g';
      not_col='r';
   end;

if(strcmp(target, 'y') && strcmp(search, 'f'))
    g=text(x(1), y(1), target_sym);
    set(g, 'color', target_col);
    for i=2:n
        g=text(x(i), y(i), not_target);
    set(g, 'color', target_col);
    end;
elseif(strcmp(target, 'n') && strcmp(search, 'f'))
 for i=1:n
  if(i<=n/2)
      char='X';
  else
      char='O';
  end;
  g=text(x(i), y(i), char);
  set(g, 'color', target_col);
end;
elseif(strcmp(target, 'y') && strcmp(search, 'c'))
    if(n==4)
           g=text(x(1), y(1), target_sym);
           set(g, 'color', target_col);
           for i=2:4
           g=text(x(i), y(i), not_target);
           set(g, 'color', not_col);
           end;
    else
      z=rand(1,1);
      if(z <= 0.5)
          unbal_feature='shape';
      else
          unbal_feature='color';
      end;
      if(strcmp(unbal_feature, 'shape'))
          g=text(x(1), y(1), target_sym);
          set(g, 'color', target_col);
          for i=2:(n/4+1)
              g=text(x(i), y(i), target_sym);
              set(g, 'color', not_col);
          end;
          for i=(n/4+2):3*n/4
              g=text(x(i), y(i), not_target);
              set(g, 'color', target_col);
          end;
          for i=(3*n/4+1):n
              g=text(x(i), y(i), not_target);
              set(g, 'color', not_col);
          end;
      else
          g=text(x(1), y(1), target_sym);
          set(g, 'color', target_col);
          for i=2:(n/4+1)
              g=text(x(i), y(i), not_target);
              set(g, 'color', not_col);
          end;
          for i=(n/4+2):3*n/4
             g=text(x(i), y(i), target_sym);
              set(g, 'color', not_col);
         end;
          for i=(3*n/4+1):n
              g=text(x(i), y(i), not_target);
              set(g, 'color', target_col);
          end;
      end;
    end;
else
       if(n==4)
           for i=1:2
           g=text(x(i), y(i), target_sym);
           set(g, 'color', target_col);
           end;
           for i=3:4
           g=text(x(i), y(i), not_target);
           set(g, 'color', not_col);
           end;           
       else    
         for i=1:(n/4)
            g=text(x(i), y(i), target_sym);
            set(g, 'color', target_col);
          end;
         for i=(n/4+1):(n/2)
            g=text(x(i), y(i), not_target);
            set(g, 'color', not_col);
          end;
          for i=(n/2+1):(3*n/4)
            g=text(x(i), y(i), not_target);
            set(g, 'color', target_col);
          end;
          for i=(3*n/4+1):n
            g=text(x(i), y(i), target_sym);
            set(g, 'color', not_col);
          end;
       end;
end;

outpt=1;
