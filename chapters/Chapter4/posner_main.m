%posner_main

all_trials=zeros(4,64);
for i=1:4
    all_trials(1,(16*(i-1)+1):16*i)=i;
end;
all_trials(2,:)=repmat([1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4], 1, 4);
all_trials(3,:)=repmat([1 1 2 2], 1, 16);
all_trials(4,:)=repmat([1 2], 1, 32);

cue_position=zeros(2, 1);
trials=20;
valid_time=zeros(640, 1);
invalid_time=zeros(640, 1);
one_hundred_time=zeros(640,1);
three_hundred_time=zeros(640,1);
hor_dist=zeros(640, 1);
vert_dist=zeros(640,1);
val_counter=1;
inval_counter=1;
delay_counter=1;
delay_counter2=1;

for i=1:trials
       trial_rand=randperm(64);
    for j=1:64
           x=all_trials(: , trial_rand(j));
           cue_position(1)=4*(x(1)-1);
           cue_position(2)=4*(x(2)-1);
           if(x(3) == 1)
               validity = 'v';
           else
               validity = 'i';
           end;
           if(x(4) == 1)
               delay=0.1;
           else
               delay=0.3;
           end;
       [target_box_x, target_box_y]=posner(validity, delay, cue_position);
       tic;
       pause;
       temp_t=toc;
       close;
       if(x(3)==1)
           valid_time(val_counter) = temp_t;
           val_counter=val_counter+1;
       else
           invalid_time(inval_counter)=temp_t;
           hor_dist(inval_counter)=abs(target_box_x-cue_position(1));
           vert_dist(inval_counter)=abs(target_box_y-cue_position(2));
           inval_counter=inval_counter+1;
       end;
       if(x(4) ==1)
       one_hundred_time(delay_counter) = temp_t;
       delay_counter=delay_counter+1;
       else
       three_hundred_time(delay_counter2)=temp_t;
       delay_counter2=delay_counter2+1;
       end;       
    end;
end;

%Based on histograms of the valid and invalid reaction times, I have chosen
%to throw out data with reaction times less than 0.1 sec. This leads to
%throwing out about 10% of the data.


valid_time2=[];
invalid_time2=[];
hor_dist2=[];
vert_dist2=[];
one_hundred_time2=[];
three_hundred_time2=[];

for i=1:length(valid_time)
    if(valid_time(i) > 0.1)
       valid_time2=[valid_time2, valid_time(i)];
    end;
    if(invalid_time(i) > 0.1)
        invalid_time2=[invalid_time2, invalid_time(i)];
        hor_dist2=[hor_dist2, hor_dist(i)];
        vert_dist2=[vert_dist2, vert_dist(i)];
    end;
    if(one_hundred_time(i) > 0.1)
        one_hundred_time2=[one_hundred_time2, one_hundred_time(i)];
    end;
    if(three_hundred_time(i) > 0.1)
        three_hundred_time2=[three_hundred_time2, three_hundred_time(i)];
    end;
end;


%Figure 1 is
%hist(valid_time);
%Figure 2 is
%hist(invalid_time)
%Figure 3 is
%scatter(valid_time, invalid_time);
%Figure 4 is
%scatter(one_hundred_time, three_hundred_time);
%Figure 5 is the histogram for the reaction time with a 300 msec delay.
%If you need more graphs such as more scatter plots or histograms just let
%me know!!

total_dist=(hor_dist2.^2+vert_dist2.^2).^(1/2);

%Prob 1.
[h, sig]=ttest2(valid_time2, invalid_time2)
%h=1 indicates reject null hypo. ie (there is a difference)
%h=0 indicates no significant difference
%For my data (h, sig)=(0, 0.3803) so the null hypothesis is not rejected.
%This result is unusual and probably occured because of low statistical power
%Since we are only measuring very slight differences in reaction time, I
%may have needed more trials.

%Problem 2
[h, sig]=ttest2(one_hundred_time2, three_hundred_time2)
%h=1 indicates reject null hypo. ie (there is a difference)
%h=0 indicates no significant difference
%For my data (h, sig)=(1, 1.957e-127), so we reject the null hypothesis,
%and state that the reation time is decreased when the delay is 300 msec as
%compared to when the delay is 100 msec. This can be easily seen from
%plotting
%plot(one_hundred_time2)
%hold on; plot(three_hundred_time2, 'r')

%Prob 3a Figure 6
plot(total_dist, invalid_time2, '.');
%Prob 3b Figure 7
plot(hor_dist2, invalid_time2, '.');
%Prob 3c Figure 8
plot(vert_dist2, invalid_time2, '.');

%Prob4
mean_hor_dist0=[];
mean_hor_dist4=[];
mean_hor_dist8=[];
mean_hor_dist12=[];
for i=1:length(hor_dist2)
    if (hor_dist2(i) == 0)
        mean_hor_dist0=[mean_hor_dist0, invalid_time2(i)];
    elseif (hor_dist2(i) == 4)
        mean_hor_dist4=[mean_hor_dist4, invalid_time2(i)];
    elseif (hor_dist2(i) == 8)
        mean_hor_dist8=[mean_hor_dist8, invalid_time2(i)];
    else
        mean_hor_dist12=[mean_hor_dist12, invalid_time2(i)];
    end;
end;
mean_hor_dist0=mean(mean_hor_dist0);
mean_hor_dist4=mean(mean_hor_dist4);
mean_hor_dist8=mean(mean_hor_dist8);
mean_hor_dist12=mean(mean_hor_dist12);
 
mean_vert_dist0=[];
mean_vert_dist4=[];
mean_vert_dist8=[];
mean_vert_dist12=[];
for i=1:length(vert_dist2)
    if (vert_dist2(i) == 0)
        mean_vert_dist0=[mean_vert_dist0, invalid_time2(i)];
    elseif (vert_dist2(i) == 4)
        mean_vert_dist4=[mean_vert_dist4, invalid_time2(i)];
    elseif (vert_dist2(i) == 8)
        mean_vert_dist8=[mean_vert_dist8, invalid_time2(i)];
    else
        mean_vert_dist12=[mean_vert_dist12, invalid_time2(i)];
    end;
end;
mean_vert_dist0=mean(mean_vert_dist0);
mean_vert_dist4=mean(mean_vert_dist4);
mean_vert_dist8=mean(mean_vert_dist8);
mean_vert_dist12=mean(mean_vert_dist12);

x=[0, 4, 8, 12];
%Figure 9 
plot(x, [mean_hor_dist0, mean_hor_dist4, mean_hor_dist8, mean_hor_dist12]);
 hold on;
plot(x, [mean_vert_dist0, mean_vert_dist4, mean_vert_dist8, mean_vert_dist12], 'r');
 %Strangely my scanner performed better the farther apart the target
 %and cue were in the vertical direction, but became worse when the target
 %and cue were farther apart in the horizontal direction. For me the
 %scanner is faster in the vertical direction.
 
 %Prob. 5
 %The total speed of the scanner is just the square root of the sum of the
 %squares of the attention scanner in the vertical and horizontal
 %directions. The speeds in these directions are equal to the absolute
 %value of the inverse of slope of the best fit lines to the data in Figure
 %9. This speed is in units of inches/sec.
 P=polyfit([0, 4, 8, 12], [mean_hor_dist0, mean_hor_dist4, mean_hor_dist8, mean_hor_dist12], 1);
 %gives hor. slope of 0.0004 (sec/inch)=0.25 inches/msec in the horizontal
 %direction
 P=polyfit([0, 4, 8, 12], [mean_vert_dist0, mean_vert_dist4, mean_vert_dist8, mean_vert_dist12], 1);
 %gives a vert. slope of -0.001 (sec/inch)=1 inch/msec in the vertical
 %direction
 
 