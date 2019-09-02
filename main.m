%% PRM Matlab Workshop 1: Dice Game & Monty Hall Problem
%% Dice game
% 1g) Procedure that simulates dice game with summed
% values ranging from 2 to 4
clc, clear
% x0 is the sum of the first roll x is the sum of the
% consecutive roll onwards

roll = [0 0];
roll(1) = randi(2);
roll(2) = randi(2);
x0 = sum(roll)

if (x0 == 2)
    score = 0
else
    roll(1) = randi(2);
    roll(2) = randi(2);
    x = sum(roll)
    if (x == x0)
        % If sum of consecutive roll is the same as the
        % first roll, game is won.
        score = 1
    elseif (x == 2)
        % If sum of consecutive roll is 2, game is
        % lost.
        score = 0
    else
        % If sum of consecutive roll is neither, keep
        % rolling.
        while (x ~= x0) || (x ~= 2)
            roll(1) = randi(2);
            roll(2) = randi(2);
            x = sum(roll)
            if (x == x0)
                score = 1
                break
            elseif (x == 2)
                score = 0
                break
            end
        end
    end
end
%% 1h) Repeat game for 10 trials
clc, clear

% n is the number of times dice & goats is played
n = 10;

score = zeros(n, 1);

for k = 1:n
    score(k) = diceGame(2) ;
end
mean(score)
%% 1j) Repeat game for 50'000 trials
clc, clear

% n is the number of times dice & goats is played
n = 50e3;

score = zeros(n, 1);

for k = 1:n
    score(k) = diceGame(2) ;
end
mean(score)
%% Dice game with summed values ranging from 2 to 12
% 1k) Using n = 10 number of trials
clc, clear

n = 10;

for k = 1:n
    score(k) = diceGame(12) ;
end
mean(score)
%% Dice game with summed values ranging from 2 to 12o 12
% 1k) Using n = 50e3 number of trials
clc, clear

n = 50e3;

for k = 1:n
    score(k) = diceGame(12) ;
end
mean(score)
%% Monty Hall Game Show Problem
% 2a) Procedure that simulates player sticking with
% original selection
clc, clear

% 0 represents a goat, 1 represents a car
v = [0 0 1];
% Randomly shuffles vector
v = v(randperm(length(v)))

select = randi(3)
if v(select) == 1
    score = 1
else
    score = 0
end
%% Monty Hall Game Show Problem
%% 2a) Procedure that simulates player sticking with
% original selection

% 0 represents a goat, 1 represents a car
v = [0 0 1];
% Randomly shuffles vector
v = v(randperm(length(v)));

select = randi(3);
if v(select) == 1
    score = 1;
else
    score = 0;
end
%% 2a) Procedure that simulates player switching
% original selection
clc, clear

% 0 represents a goat, 1 represents a car
v = [0 0 1];
% Randomly shuffles vector
v = v(randperm(length(v)))

select = randi(3)
% Remove original selection because player is going to
% switch selection
v(select) = [];
% Remove 0(goat/s) if there are any
v(find(v == 0)) = [];

% The leftover element is the element the player will
% switch to
if v == 1
    % If leftover element is 1(car), player wins
    score = 1
else
    % Otherwise, vector will be empty. This means
    % player's initial selection was a car, therefore
    % player has lost.
    score = 0
end
%% 2b)
% Proability of winning from 10 trials
clc, clear

% Number of trials
n = 10;
score1 = zeros(n, 1);
score2 = zeros(n, 1);

% Player sticks with original selection
for k1 = 1:n
    score1(k1, 1) = monty_noSwitch();
end
% Probability of winning given that player sticks with
% initial selection
prob_noSwitch = mean(score1)

% Player changes selection
for k2 = 1:n
    score2(k2, 1) = monty_switch();
end
% Probability of winning given that player changes the
% initial selection
prob_switch = mean(score2)
%% 2c)
% Proability of winning from 50e3 trials
clc, clear

% Number of trials
n = 50e3;
score1 = zeros(n, 1);
score2 = zeros(n, 1);

% Player sticks with original selection
for k1 = 1:n
    score1(k1, 1) = monty_noSwitch();
end
% Probability of winning given that player sticks with
% initial selection
prob_noSwitch = mean(score1)

% Player changes selection
for k2 = 1:n
    score2(k2, 1) = monty_switch();
end
% Probability of winning given that player changes the
% initial selection
prob_switch = mean(score2)