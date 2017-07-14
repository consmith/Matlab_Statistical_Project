function[User_Name] = UserName(User_Name)
%UserName    Creates a user name for the StatFile script
%
%   UserName Creates a user name for the StatFile script
% 
%   UserName overwrites these variables:
%        Old_User_Name
%        User_Name
%
%   UserName prompts the user to input values for 
%        User_Name


    %Saving old user name
    
    Old_User_Name = User_Name;
    
    User_Name = input('\nPlease enter your name:','s');
    
    %if user changes their mind, enters nothing: no change
    
    if isempty(User_Name)
        User_Name = Old_User_Name;
    end
    
    if strcmp(User_Name,'user')
        fprintf(...
            'the entered user name is a default, and will not allow you to create an output file.')
    end
        
    
    fprintf('\nWelcome, %s',User_Name)
end

    