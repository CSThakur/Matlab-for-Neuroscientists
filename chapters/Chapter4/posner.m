function [target_box_x, target_box_y]=posner(validity, delay, cue_position)
%validity = 'v' for valid trial and 'i' for invalid
%delay should be a number for the delay time in msec for example 100 or 300

h=figure;
xlim([0 16]);
ylim([0 16]);
n=randperm(4);
m=randperm(4);
%cue_box_x=4*(n(1)-1);
%cue_box_y=4*(m(1)-1);
cue_box_x=cue_position(1);
cue_box_y=cue_position(2);
if(strcmp(validity, 'v'))
    target_box_x=cue_box_x;
    target_box_y=cue_box_y;
else
    a=4*(n(1)-1);
    b=4*(m(1)-1);
    if((a == cue_position(1)) && (b == cue_position(2)))
        target_box_x=4*(n(2)-1);
        target_box_y=4*(m(2)-1);
    else
        target_box_x=a;
        target_box_y=b;
    end;
end;
cue_fig=rectangle('Position', [cue_box_x, cue_box_y, 4, 4]);
set(cue_fig, 'FaceColor', 'r');
set(cue_fig, 'EdgeColor', 'b');
pause(0.05);
clf;
xlim([0 16]);
ylim([0 16]);
pause(delay);
target_fig=rectangle('Position', [target_box_x, target_box_y, 4, 4]);
set(target_fig, 'FaceColor', 'r');
set(target_fig, 'EdgeColor', 'b');

