function[Stat_Probability,User_Dist_Opinion] = ProbabilityFinder(Stat_Mean,Stat_Std,Inputted_Data,User_Dist_Opinion)
%ProbabilityFinder    Finds probability from a given x or z value
%
%   ProbabilityFinder Finds probability from a given x or z value
% 
%   ProbabilityFinder overwrites these variables:
%        Stat_Probability
%        User_Dist_Opinion
%
%   ProbabilityFinder prompts the user to input values for 
%        User_Dist_Opinion
%        Prob_Finding_Value
%        Value_X
%        Value_Z
 

    %Initializing variable
    Stat_Probability = -1;

    
    %Error Checking for no data
    if isempty(Inputted_Data)
        fprintf('\nThere is no data to evaluate')
    else
        
        %Getting opinion on normal from user
        
        if isempty(User_Dist_Opinion) == true
            while ((strcmpi(User_Dist_Opinion,'y') == false) && (strcmpi(User_Dist_Opinion,'n') == false)) == true
                User_Dist_Opinion = input('\nDo you believe this data is normally distributed?(y/n)','s');
            
                if (strcmpi(User_Dist_Opinion,'y') == false) && (strcmpi(User_Dist_Opinion,'n') == false)
                    fprintf('\nThe input must be either ''y'' or ''n''');
                end 
            end
        end
        
        %Asking for how to find prob
        
        fprintf('\nHow would you like to find the probability?')
        fprintf('\n1 - Z value')
        fprintf('\n2 - X value')
        Prob_Finding_Value = input('\nWhich would you like to input? (1/2)','s');
        
        
        %Finding by x and by z
        if strcmpi(Prob_Finding_Value,'x') || strcmp(Prob_Finding_Value,'2')
            
            Value_X = 'letters';
            
            %Error checking for Value_X
            
            while sum(isstrprop(Value_X,'alpha')) > 0
                Value_X = input('\nWhat is the x value you will use?','s');
            
                if sum(isstrprop(Value_X,'alpha')) > 0
                    fprintf('\nThe input must be a number');
                end
            end
            
            Value_X = str2num(Value_X);
            
            %Have input now, use normcdf
            
            Stat_Probability = normcdf(Value_X,Stat_Mean,Stat_Std);
            
            fprintf('\nThe calculated probability at this value is %.4f',Stat_Probability)
            
            %If not normal, print warning
            
            if strcmpi(User_Dist_Opinion,'n')
                fprintf('\n*This calculation is not accurate, since the data is believed to be non-normal*')
            end
            
        elseif strcmpi(Prob_Finding_Value,'z') || strcmp(Prob_Finding_Value,'1')
            
            Value_Z = 'letters';
            
            %Error Checking for Z
            
            while sum(isstrprop(Value_Z,'alpha')) > 0
                Value_Z = input('\nWhat is the z value you will use?','s');
            
                if sum(isstrprop(Value_Z,'alpha')) > 0
                    fprintf('\nThe input must be a number');
                end
            end
            
            Value_Z = str2num(Value_Z);
            
            Value_X = (Value_Z * Stat_Std) + Stat_Mean;
            
            %Use Value Z to get value x, then use normcdf
            
            Stat_Probability = normcdf(Value_X,Stat_Mean,Stat_Std);
            
            fprintf('\nThe calculated probability at this value is %.4f',Stat_Probability)
            
            %If not normal, print warning
            
            if strcmpi(User_Dist_Opinion,'n')
                fprintf('\n*This calculation is not accurate, since the data is believed to be non-normal*')
            end
            
        else
            fprintf('\nthe inputted value was not an ''x'',''z'',''1'', or ''2''')
        end
    end
   
end