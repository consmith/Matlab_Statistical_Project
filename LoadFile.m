function[Inputted_Data] = LoadFile(Inputted_Data)
%LoadFile    Loads the data file for StatFile script
%
%   LoadFile Loads the data file for StatFile script
% 
%   LoadFile overwrites these variables:
%        Inputted_Data
%
%   LoadFile prompts the user to input values for 
%        Chosen_File
%        Overwrite_Check



    %Initializing variables
    
    Old_Data = Inputted_Data;

    File_Existence = false;
    
    Quit_Load = false;
    
    %entire code is in a while loop, so that it can repeat until a file is
    %found

    while File_Existence == false
        
        fprintf('\nType ''quit'' without the quotes to not load a file')
        
        Chosen_File = input(...
            '\nType the name of the file you would like to load (with the file extension):','s');
        
        %Checking if user quit, found a file, or typed wrong
        
        if strcmpi(Chosen_File,'quit') == true
            File_Existence = true;
            Quit_Load = true;
        elseif exist(Chosen_File,'file')
            File_Existence = true;
        else
            File_Existence = false;
            fprintf('\nThe inputted file does not exist')
            fprintf('\nyour input should look something like this: ''example.txt''')
        end
        
    end
    
    %if user quit, quit.. else go on
    
    if Quit_Load == true
        Inputted_Data = Old_Data;
    else
        
        %Ensuring data isnt being overwritten, if so, asks user if its
        %fine.
        
        if isempty(Old_Data)
            Inputted_Data = load(Chosen_File);
        else
            Overwrite_Check = input(...
                '\nIf you load this file, it will overwrite a previously loaded file, is this alright? (y/n)','s');
            if strcmpi(Overwrite_Check,'y') || strcmpi(Overwrite_Check,'yes')
               Inputted_Data = load(Chosen_File); 
               clear ('User_Dist_Opinion');
            elseif strcmpi(Overwrite_Check,'n') || strcmpi(Overwrite_Check,'no')
               Inputted_Data = Old_Data;
            end
        end
                
            
    end
    
    
end
    
    
