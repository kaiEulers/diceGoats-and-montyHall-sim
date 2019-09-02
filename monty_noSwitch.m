% Procedure that simulates player sticking with
% original selection
function score = monty_noSwitch()
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
end