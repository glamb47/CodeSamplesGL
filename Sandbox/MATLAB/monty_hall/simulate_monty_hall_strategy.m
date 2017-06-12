function winProbability = simulate_monty_hall_strategy(strategy, numPlays)
% strategy: A string that may be either 'stay' or 'switch'
% numPlays: # of times to play the Monty Hall game using strategy
% winProbability: # of times the car is won divided by numPlays

% STAY STRATEGY
if strcmp(strategy, 'stay') % strcmp compares two strings
    wins = 0;
    for t = 1:numPlays
        car = randi(3,1);
        guess = randi(3,1);
        if car == guess
            wins = wins + 1;
        end
    end
winProbability = wins/numPlays;

% SWITCH STRATEGY
elseif strcmp(strategy, 'switch')
    wins = 0;
    for t = 1:numPlays
        car = randi(3,1);
        guess = randi(3,1);
        goats = setdiff([1,2,3], car); % put goats behind the doors where the car is not
        if car == guess
            monty_door = goats(randi(2,1)); % if contestant's guess is right, monty can open up either other door
        else
            monty_door = setdiff(goats, guess); % if contestant's guess is wrong, monty opens up the remaining goat door
        end
        door_switch = setdiff([1,2,3], [guess, monty_door]); % door_switch is the door leftover from your guess and the door that monty revealed
        guess = door_switch;
        if guess == car
            wins = wins + 1;
        end
    end
end
winProbability = wins/numPlays;
