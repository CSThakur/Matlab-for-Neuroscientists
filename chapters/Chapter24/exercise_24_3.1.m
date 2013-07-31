% use the same threshold for both options
threshold = 20;
for trial=1:3
    figure
    hold on
    choice_one = model2(0.4, threshold);
    choice_two = model2(0.6, threshold);
    % the shorter evidence set is the selected option
    % truncate the longer to the length of the shorter
    min_length = min(length(choice_one), length(choice_two));
    choice_one = choice_one(1:min_length);
    choice_two = choice_two(1:min_length);
    plot(1:length(choice_one), choice_one, 'r')
    plot(1:length(choice_two), choice_two, 'b')
    legend('choice one (p=0.4)', 'choice two (p=0.6)')
end
