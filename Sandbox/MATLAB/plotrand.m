n = 50;
r = rand(n,1);
plot(r)
m = mean(r);
hold on
plot([0,n],[m,m])
hold off
title('Mean of Random Uniform Data')
% Generate random data from a uniform distribution
% and calculate the mean. Plot the data and the mean.
n = 50;
r = rand(n,1);
plot(r)
% Draw a line from (0,m) to (n,m)
m = mean(r);
hold on
plot([0,n],[m,m])
hold off
title ('Mean of Random Uniform Data')