function [Inputted_Data] = ClearData(Inputted_Data)
%ClearData    Clears data from StatFile script
%
%   ClearData Clears data from StatFile script
% 
%   ClearData overwrites these variables:
%        Inputted_Data
%
%   ClearData prompts the user to input values for 
%        Check_Clear


    %Checking if user actually wants to clear
    
    Check_Clear = input('Are you sure you want to clear the loaded data? y/n :','s');
    
    %Evaluating answer to either delete data or keep it
    
    if strcmpi(Check_Clear,'y') || strcmpi(Check_Clear,'yes')
        Inputted_Data = [];
        fprintf('\nThe data was cleared')
        clear('User_Dist_Opinion');
    elseif strcmpi(Check_Clear,'n') || strcmpi(Check_Clear,'no')
        fprintf('\nThe data will not be cleared')
    else
        fprintf('\nThe answer could not be understood')
        fprintf('\nThe data will not be cleared')
    end
        
end