clear;
% Create 5 6-sided die
numDice = 5;
numSides = 6
for ndx = 1:numDice
    dice(ndx) = Die(numSides);
end

resp = '';

while strcmp(resp, 'q') == 0
    
    clc;
    
    resp = '[1 2 3 4 5]';
    
    % Perform up to 3 rolls
    for rollNdx = 1:3
        indicesOfDieToRoll = eval(resp);
        
        % roll dice
        for ndx = indicesOfDieToRoll
            dice(ndx).roll();
        end
        
        disp(' ');
        disp(['Roll number ' num2str(rollNdx)]);
        disp([dice.lastRolledValue]);
        
        if rollNdx < 3
            resp = input('Enter an array expression for the dice to re-roll (e.g. [1 5] for die 1 and 5): ', 's');
            if (strcmp(resp, '') || strcmp(resp, '[]') || strcmp(resp, 'q'))
                break;
            end
        end
    end
    
    % Determine score
    
    % Create histogram of final die values
    rollHist = hist([dice.lastRolledValue], 1:6);

    % Look for number of matching values
    [maxRollHist, ndxOfMax] = max(rollHist);
    score = 0;
    scoreDescription = 'No score';
    
    if maxRollHist == 5
        score = 50;
        scoreDescription = 'Yahtzee!';
    elseif (maxRollHist == 4)
        score = sum([dice.lastRolledValue]);
        scoreDescription = 'Four of a Kind';
    elseif maxRollHist == 3
        if ~isempty(find(rollHist == 2))
            score = 25;
            scoreDescription = 'Full House';
        else
            score = sum([dice.lastRolledValue]);
            scoreDescription = 'Three of a Kind';
        end
    else
        % Look for straights
        if all(rollHist(1:5)) || all(rollHist(2:6))
            score = 40;
            scoreDescription = 'Large Straight';
        elseif all(rollHist(1:4)) || all(rollHist(2:5)) || all(rollHist(3:6))
            score = 30;
            scoreDescription = 'Small Straight';
        end
    end
    disp(' ');
    disp(' ');
    disp(' ');
    disp([scoreDescription ' : ' num2str(score) ' pts']);

    disp(' ');
    disp(' ');
    disp(' ');
    
    resp = input('Type q<ENTER> to quit, or just type <ENTER> to play again:  ', 's');
end