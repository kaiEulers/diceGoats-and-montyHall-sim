% Procedure that simulates player switching original
% selection
function score = monty_switch()
    % 0 represents a goat, 1 represents a car
    v = [0 0 1];
    % Randomly shuffles vector
    v = v(randperm(length(v)));
    
    select = randi(3);
    % Remove original selection because player is going to
    % switch selection
    v(select) = [];
    % Remove 0(goat/s) if there are any
    v(find(v == 0)) = [];
    
    % The leftover element is the element the player will
    % switch to
    if v == 1
        %     If leftover element is 1(car), player wins
        score = 1;
    else
        %     Otherwise, vector will be empty. This means
        %     player's initial selection was a car, therefore
        %     player has lost.
        score = 0;
    end
end