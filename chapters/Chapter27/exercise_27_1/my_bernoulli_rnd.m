function x = my_bernoulli_rnd(p)
  if rand() < p
    x = 1;
  else
    x = 0;
  end
