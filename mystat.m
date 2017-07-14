function [Mean,Median,Mode,Var,Std,Min,Max,Count] = mystat(inputvector)
%mystat    Finds statistical information about a given vector
%
%   mystat Finds statistical information about a given vector
% 
%   mystat overwrites these variables:
%           Mean
%           Median
%           Mode
%           Var
%           Std
%           Min
%           Max
%
%   mystat prompts the user to input values for 
%      inputvector


[Rows,Columns] = size(inputvector);

if Columns == 2
    inputvector = [inputvector(:,1);inputvector(:,2)];
end

Mean = mean(inputvector);
Median = median(inputvector);
Mode = mode(inputvector);
Var = var(inputvector);
Min = min(inputvector);
Max = max(inputvector);
Count = numel(inputvector);

if Count > 30
    Std = std(inputvector,1);
else
    Std = std(inputvector);
end
end

