%Garret Lamb
disp('   ')
simulate_monty_hall_strategy('stay', 100000);
win_percent = ans*100;
disp('Strategy: Stay')
disp('Number of Plays: 100,000')

stay_wins = ['Win Percentage: ', num2str(win_percent),'%'];
disp(stay_wins)

loss_percent = 100 - win_percent;
stay_loss = ['Loss Percentage: ', num2str(loss_percent),'%'];
disp(stay_loss)
disp('   ')

simulate_monty_hall_strategy('switch', 100000);
win_percent = ans*100;
disp('Strategy: Switch')
disp('Number of Plays: 100,000')

switch_wins = ['Win Percentage: ', num2str(win_percent),'%'];
disp(switch_wins)

loss_percent = 100 - win_percent;
switch_loss = ['Loss Percentage: ', num2str(loss_percent),'%'];
disp(switch_loss)