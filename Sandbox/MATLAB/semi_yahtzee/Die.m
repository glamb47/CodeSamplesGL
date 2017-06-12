%Garret Lamb
classdef Die < handle
    % DIE
    % simulates the roll of die with varying number of sides
    
    properties
        numberOfSides
        lastRolledValue
    end
    
    methods
        function obj = Die(numberOfSides) % constructor - initializes numberOfSides
            obj.numberOfSides = numberOfSides;
        end
        function rolledValue = roll(obj)
            obj.lastRolledValue = round(rand(1,1)*(obj.numberOfSides-1)+1); 
            % simulation of roll - returns random number 1 - numberOfSides
            % sets the random value to the lastRolledValue property
        end
    end
end