% Procedure that simulates dice game with summed values
% ranging from 2 to max
function score = diceGame(max)
    roll = [0 0];
    roll(1) = randi(max);
    roll(2) = randi(max);
    x0 = sum(roll);
    
    if (x0 == 2)
        score = 0;
    else
        roll(1) = randi(max);
        roll(2) = randi(max);
        x = sum(roll);
        if (x == x0)
            % If sum of consecutive roll is the same as the
            % first roll, game is won.
            score = 1;
        elseif (x == 2)
            % If sum of consecutive roll is 2, game is
            % lost.
            score = 0;
        else
            % If sum of consecutive roll is neither, keep
            % rolling.
            while (x ~= x0) || (x ~= 2)
                roll(1) = randi(max);
                roll(2) = randi(max);
                x = sum(roll);
                if (x == x0)
                    score = 1;
                    break
                elseif (x == 2)
                    score = 0;
                    break
                end
            end
        end
    end
end