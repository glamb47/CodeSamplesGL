clc
close all
clear all

% The Monty Hall Problem:
% Three doors hiding two goats and one car. You want the car (obviously).
% You pick a door, then game host always reveals a goat.
% Should you switch to the other door?

% # of trials
N = 1e7;
fprintf('%d trials...\n',N)

% where the car is
car = draw_from_n(N,3);

% I pick a door
my_choice = draw_from_n(N,3);

A = zeros(3,3,N);
A(2,1,:) = 3;
A(3,1,:) = 2;
A(1,2,:) = 3;
A(3,2,:) = 1;
A(1,3,:) = 2;
A(2,3,:) = 1;
a = [2 3];
A(1,1,:) = a(draw_from_n(N,2));
a = [1 3];
A(2,2,:) = a(draw_from_n(N,2));
a = [1 2];
A(3,3,:) = a(draw_from_n(N,2));

B = A;
a = [2 3];
B(1,1,:) = a(draw_from_n(N,2));
a = [1 3];
B(2,2,:) = a(draw_from_n(N,2));
a = [1 2];
B(3,3,:) = a(draw_from_n(N,2));

%% never switch
fprintf('No switch: P(get car) = %.4f\n',sum(car == my_choice)/N)


%% always switch
% host picks a door
% host avoids my door and the door with car (they could be the same)
host_choice = zeros(N,1);
for i = 1:N     % ugly for loop. gotta be a cleaner way...
    %host_option = exclude2(car(i),my_choice(i));
    %host_choice(i) = host_option(draw_from_n(1,numel(host_option)));
    %my_choice(i) = exclude2(my_choice(i),host_choice(i));

    % even faster than exclude1 and exclude2
    host_choice(i) = A(car(i),my_choice(i),i);
    my_choice(i) = B(my_choice(i),host_choice(i),i);
end
fprintf('Always switch: P(get car) = %.4f\n',sum(car == my_choice)/N)
