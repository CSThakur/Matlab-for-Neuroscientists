%main script


start=figure;
text(0.2, 0.7, 'Press any key to begin the 1st block');
text(0.05, 0.5, 'For the trials press ''t'' if there''s a target and ''n'' if there isn''t a target');
pause;
close;
right = 0;
wrong = 0;
trial_block=30;
%1st block pop-out with 4 objects; we do 30 trials;
n=4;
t_target4pop=[];
t_no_target4pop=[];
z=randperm(trial_block);
for i=1:trial_block
  if(z(i) <=(trial_block/2))
      target='y';
  else
      target='n';
  end;
g=Treisman(n, 'f', target);
tic;
pause;
temp_t=toc;
%t=[t, temp_t];
temp_ans=get(g, 'CurrentCharacter');
%ans=[ans, temp_ans];
close;
  if((strcmp(target, 'y') && strcmp(temp_ans, 't'))) 
  t_target4pop=[t_target4pop, temp_t];
  right = right + 1;
  elseif((strcmp(target, 'n') && strcmp(temp_ans, 'n')))
  t_no_target4pop=[t_no_target4pop, temp_t];
  right = right + 1;
  else
  wrong = wrong + 1;
  end;
end;
t_targ4pop_mean=mean(t_target4pop);
t_no_targ4pop_mean=mean(t_no_target4pop);
%Next block
next=figure;
text(0.2, 0.7, 'Press any key to begin the next block');
text(0.05, 0.5, 'For the trials press ''t'' if there''s a target and ''n'' if there isn''t a target');
pause;
close;
right8 = 0;
wrong8 = 0;
%trial_block=30;
%2nd block pop-out with 8 objects; we do 30 trials;
n=8;
t_target8pop=[];
t_no_target8pop=[];
z=randperm(trial_block);
for i=1:trial_block
  if(z(i) <=(trial_block/2))
      target='y';
  else
      target='n';
  end;
g=Treisman(n, 'f', target);
tic;
pause;
temp_t=toc;
%t=[t, temp_t];
temp_ans=get(g, 'CurrentCharacter');
%ans=[ans, temp_ans];
close;
  if((strcmp(target, 'y') && strcmp(temp_ans, 't'))) 
  t_target8pop=[t_target8pop, temp_t];
  right8 = right8 + 1;
  elseif((strcmp(target, 'n') && strcmp(temp_ans, 'n')))
  t_no_target8pop=[t_no_target8pop, temp_t];
  right8 = right8 + 1;
  else
  wrong8 = wrong8 + 1;
  end;
end;
t_targ8pop_mean=mean(t_target8pop);
t_no_targ8pop_mean=mean(t_no_target8pop);

%Next block
next=figure;
text(0.2, 0.7, 'Press any key to begin the next block');
text(0.05, 0.5, 'For the trials press ''t'' if there''s a target and ''n'' if there isn''t a target');
pause;
close;
right12 = 0;
wrong12 = 0;
%trial_block=30;
%3rd block pop-out with 12 objects; we do 30 trials;
n=12;
t_target12pop=[];
t_no_target12pop=[];
z=randperm(trial_block);
for i=1:trial_block
  if(z(i) <=(trial_block/2))
      target='y';
  else
      target='n';
  end;
g=Treisman(n, 'f', target);
tic;
pause;
temp_t=toc;
%t=[t, temp_t];
temp_ans=get(g, 'CurrentCharacter');
%ans=[ans, temp_ans];
close;
  if((strcmp(target, 'y') && strcmp(temp_ans, 't'))) 
  t_target12pop=[t_target12pop, temp_t];
  right12 = right12 + 1;
  elseif((strcmp(target, 'n') && strcmp(temp_ans, 'n')))
  t_no_target12pop=[t_no_target12pop, temp_t];
  right12 = right12 + 1;
  else
  wrong12 = wrong12 + 1;
  end;
end;
t_targ12pop_mean=mean(t_target12pop);
t_no_targ12pop_mean=mean(t_no_target12pop);

%Next block
next=figure;
text(0.2, 0.7, 'Press any key to begin the next block');
text(0.05, 0.5, 'For the trials press ''t'' if there''s a target and ''n'' if there isn''t a target');
pause;
close;
right16 = 0;
wrong16 = 0;
%trial_block=30;
%4th block pop-out with 16 objects; we do 30 trials;
n=16;
t_target16pop=[];
t_no_target16pop=[];
z=randperm(trial_block);
for i=1:trial_block
  if(z(i) <=(trial_block/2))
      target='y';
  else
      target='n';
  end;
g=Treisman(n, 'f', target);
tic;
pause;
temp_t=toc;
%t=[t, temp_t];
temp_ans=get(g, 'CurrentCharacter');
%ans=[ans, temp_ans];
close;
  if((strcmp(target, 'y') && strcmp(temp_ans, 't'))) 
  t_target16pop=[t_target16pop, temp_t];
  right16 = right16 + 1;
  elseif((strcmp(target, 'n') && strcmp(temp_ans, 'n')))
  t_no_target16pop=[t_no_target16pop, temp_t];
  right16 = right16 + 1;
  else
  wrong16 = wrong16 + 1;
  end;
end;
t_targ16pop_mean=mean(t_target16pop);
t_no_targ16pop_mean=mean(t_no_target16pop);

%Now we begin the conjunction search.
next=figure;
text(0.2, 0.7, 'Press any key to begin the conjunction blocks');
text(0.05, 0.5, 'For the trials press ''t'' if there''s a target and ''n'' if there isn''t a target');
pause;
close;
rightc = 0;
wrongc = 0;
trial_block=30;
%1st block conjunction with 4 objects; we do 30 trials;
n=4;
t_target4con=[];
t_no_target4con=[];
z=randperm(trial_block);
for i=1:trial_block
  if(z(i) <=(trial_block/2))
      target='y';
  else
      target='n';
  end;
g=Treisman(n, 'c', target);
tic;
pause;
temp_t=toc;
%t=[t, temp_t];
temp_ans=get(g, 'CurrentCharacter');
%ans=[ans, temp_ans];
close;
  if((strcmp(target, 'y') && strcmp(temp_ans, 't'))) 
  t_target4con=[t_target4con, temp_t];
  rightc = rightc + 1;
  elseif((strcmp(target, 'n') && strcmp(temp_ans, 'n')))
  t_no_target4con=[t_no_target4con, temp_t];
  rightc = rightc + 1;
  else
  wrongc = wrongc + 1;
  end;
end;
t_targ4con_mean=mean(t_target4con);
t_no_targ4con_mean=mean(t_no_target4con);

next=figure;
text(0.2, 0.7, 'Press any key to begin the next block');
text(0.05, 0.5, 'For the trials press ''t'' if there''s a target and ''n'' if there isn''t a target');
pause;
close;
rightc8 = 0;
wrongc8 = 0;
trial_block=30;
%2nd block conjunction with 8 objects; we do 30 trials;
n=8;
t_target8con=[];
t_no_target8con=[];
z=randperm(trial_block);
for i=1:trial_block
  if(z(i) <=(trial_block/2))
      target='y';
  else
      target='n';
  end;
g=Treisman(n, 'c', target);
tic;
pause;
temp_t=toc;
%t=[t, temp_t];
temp_ans=get(g, 'CurrentCharacter');
%ans=[ans, temp_ans];
close;
  if((strcmp(target, 'y') && strcmp(temp_ans, 't'))) 
  t_target8con=[t_target8con, temp_t];
  rightc8 = rightc8 + 1;
  elseif((strcmp(target, 'n') && strcmp(temp_ans, 'n')))
  t_no_target8con=[t_no_target8con, temp_t];
  rightc8 = rightc8 + 1;
  else
  wrongc8 = wrongc8 + 1;
  end;
end;
t_targ8con_mean=mean(t_target8con);
t_no_targ8con_mean=mean(t_no_target8con);

next=figure;
text(0.2, 0.7, 'Press any key to begin the next block');
text(0.05, 0.5, 'For the trials press ''t'' if there''s a target and ''n'' if there isn''t a target');
pause;
close;
rightc12 = 0;
wrongc12 = 0;
trial_block=30;
%3rd block conjunction with 12 objects; we do 30 trials;
n=12;
t_target12con=[];
t_no_target12con=[];
z=randperm(trial_block);
for i=1:trial_block
  if(z(i) <=(trial_block/2))
      target='y';
  else
      target='n';
  end;
g=Treisman(n, 'c', target);
tic;
pause;
temp_t=toc;
%t=[t, temp_t];
temp_ans=get(g, 'CurrentCharacter');
%ans=[ans, temp_ans];
close;
  if((strcmp(target, 'y') && strcmp(temp_ans, 't'))) 
  t_target12con=[t_target12con, temp_t];
  rightc12 = rightc12 + 1;
  elseif((strcmp(target, 'n') && strcmp(temp_ans, 'n')))
  t_no_target12con=[t_no_target12con, temp_t];
  rightc12 = rightc12 + 1;
  else
  wrongc12 = wrongc12 + 1;
  end;
end;
t_targ12con_mean=mean(t_target12con);
t_no_targ12con_mean=mean(t_no_target12con);

next=figure;
text(0.2, 0.7, 'Press any key to begin the last block');
text(0.05, 0.5, 'For the trials press ''t'' if there''s a target and ''n'' if there isn''t a target');
pause;
close;
rightc16 = 0;
wrongc16 = 0;
trial_block=30;
%4th block conjunction with 16 objects; we do 30 trials;
n=16;
t_target16con=[];
t_no_target16con=[];
z=randperm(trial_block);
for i=1:trial_block
  if(z(i) <=(trial_block/2))
      target='y';
  else
      target='n';
  end;
g=Treisman(n, 'c', target);
tic;
pause;
temp_t=toc;
%t=[t, temp_t];
temp_ans=get(g, 'CurrentCharacter');
%ans=[ans, temp_ans];
close;
  if((strcmp(target, 'y') && strcmp(temp_ans, 't'))) 
  t_target16con=[t_target16con, temp_t];
  rightc16 = rightc16 + 1;
  elseif((strcmp(target, 'n') && strcmp(temp_ans, 'n')))
  t_no_target16con=[t_no_target16con, temp_t];
  rightc16 = rightc16 + 1;
  else
  wrongc16 = wrongc16 + 1;
  end;
end;
t_targ16con_mean=mean(t_target16con);
t_no_targ16con_mean=mean(t_no_target16con);

n=[4, 8, 12, 16]';
t_target_pop=[t_targ4pop_mean, t_targ8pop_mean, t_targ12pop_mean, t_targ16pop_mean]';
t_target_con=[t_targ4con_mean, t_targ8con_mean, t_targ12con_mean, t_targ16con_mean]';

t_no_target_pop=[t_no_targ4pop_mean, t_no_targ8pop_mean, t_no_targ12pop_mean, t_no_targ16pop_mean]';
t_no_target_con=[t_no_targ4con_mean, t_no_targ8con_mean, t_no_targ12con_mean, t_no_targ16con_mean]';


[M1, p1]=corrcoef(n, t_target_pop);
M1=M1(1,2);
p1=p1(1,2);

[M2, p2]=corrcoef(n, t_target_con);
M2=M2(1,2);
p2=p2(1,2);

[M3, p3]=corrcoef(n, t_no_target_pop);
M3=M3(1,2);
p3=p3(1,2);

[M4, p4]=corrcoef(n, t_no_target_con);
M4=M4(1,2);
p4=p4(1,2);

sprintf('The correlation coefficient is %0.5g and the p-value is %0.5g for the popout trial when the target was present', M1, p1)
sprintf('The correlation coefficient is %0.5g and the p-value is %0.5g for the conjunction trial when the target was present', M2, p2)
sprintf('The correlation coefficient is %0.5g and the p-value is %0.5g for the popout trial when the target was absent', M3, p3)
sprintf('The correlation coefficient is %0.5g and the p-value is %0.5g for the conjunction trial when the target was absent', M4, p4)
comment='p-values < 0.05 are considered significant'

figure;
plot(n, t_target_pop);
hold on;
plot(n, t_target_con, 'r');
title('Correctly Identified the Presence of Target');
legend('Pop Out', 'Conjunction');
xlabel('Set Size');
ylabel('Mean Reaction Time (sec)');
hold off;

figure;
plot(n, t_no_target_pop);
hold on;
plot(n, t_no_target_con, 'r');
title('Correctly Identified the Absence of Target');
legend('Pop Out', 'Conjunction');
xlabel('Set Size');
ylabel('Mean Reaction Time (sec)');
hold off;

%These are the results for the sprintf function for the trial I ran on
%myself. The graphs are given as well.
%The correlation coefficient is -0.57912 and the p-value is 0.42088 for the popout trial when the target was present

%The correlation coefficient is 0.99994 and the p-value is 6.4571e-005 for the conjunction trial when the target was present

%The correlation coefficient is -0.032356 and the p-value is 0.96764 for the popout trial when the target was absent

%The correlation coefficient is 0.92974 and the p-value is 0.070256 for the conjunction trial when the target was absent

%p-values < 0.05 are considered significant

%For a qualitative assessment of the slopes of the graphs I would say that
%the popout task does not seem to require more mental processing time as 
%the set size increases (ie the slope is relatively flat.). However, 
%for the conjunction task there is statistically significant linear
%increase in reaction time to complete the task.
%I realize that one p-value for the conjunction task is not quite below
%0.05, so the statement made above is not exactly true from this small sample size.

%Final note in the trials ran I always scored more than 20 correct/block,
%so the mean reaction time is based on at least 20 data points as required.