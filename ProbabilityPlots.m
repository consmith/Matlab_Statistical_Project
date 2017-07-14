function [] = ProbabilityPlots(Inputted_Data)
%ProbabilityPlots    Creates a norm plot of the data from StatFile script
%
%   ProbabilityPlots Creates a norm plot of the data from StatFile script
% 
%   ProbabilityPlots overwrites these variables:
%
%   ProbabilityPlots prompts the user to input values for 


    %Error Checking for empty data
    if isempty(Inputted_Data)
        fprintf('\nThere is no data to evaluate.')
    else
        normplot(Inputted_Data)
    end
end
    