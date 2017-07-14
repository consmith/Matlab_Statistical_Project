function [Output_File_Name] = OutputFileName(Output_File_Name)
%OutputFileName    Creates the name for the output file of the StatFile script
%
%   OutputFileName Creates the name for the output file of the StatFile script
% 
%   OutputFileName overwrites these variables:
%        Output_File_Name
%
%   OutputFileName prompts the user to input values for 
%        Output_File_Name



    %Saving Old Output File name
    Oldname = Output_File_Name;
    
    fprintf('\nEnter nothing to keep the exisiting file name.');
    
    Output_File_Name = input('\nWhat would you like the output file to be named?','s');
    
    %Checking if user entered anything or wanted to keep old file.
    
    if isempty(Output_File_Name) == true
        Output_File_Name = Oldname;
    end
    
    if strcmp(Output_File_Name,'empty')
        fprintf(...
            'the entered file name is a default, and will not allow you to create an output file.')
    end
    
end

    