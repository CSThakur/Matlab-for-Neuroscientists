function [good_ones, bad_ones]=sort_greeb(output, data)


good=0;
bad=0;

for i=1:length(output)
   if(output(i)== 2)
       good=good+1;
   else
       bad=bad+1;
   end;
end;

good_ones=zeros(good, 3);
bad_ones=zeros(bad, 3);
a=1;
b=1;
for i=1:length(output)
    if(output(i)==2)
        good_ones(a,:)=data(i, :);
        a=a+1;
    else
        bad_ones(b,:)=data(i,:);
        b=b+1;
    end;
end;
plot3(good_ones(:,1), good_ones(:,2), good_ones(:,3), '.');
hold on;
plot3(bad_ones(:,1), bad_ones(:,2), bad_ones(:,3), '.r');