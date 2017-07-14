%StatFileAnalysis    Finds statistical information from an inputted file
%
%   StatFileAnalysis Finds statistical information from an inputted file
% 
%   StatFileAnalysis overwrites these variables:
%        Input_Value
%        User_Name
%        Inputted_Data
%        User_Dist_Opinion
%        Output_File_Name
%        fit
%
%   StatFileAnalysis prompts the user to input values for 
%        Input_Value



%Initializing variables

Input_Value = 0;

User_Name = 'user';

Inputted_Data = [];

User_Dist_Opinion = [];

Output_File_Name = 'empty';

clc

while Input_Value ~= 11
    
    fprintf('\nMAIN MENU\n')

    fprintf('\n1 - Set user name\n')
    fprintf('2 - Load data file\n')
    fprintf('3 - Clear data from memory\n')
    fprintf('4 - Set output file name\n')
    fprintf('5 - Plot histogram\n')
    fprintf('6 - Plot histogram fit\n')
    fprintf('7 - Plot probability plots\n')
    fprintf('8 - Basic Statistical Data\n')
    fprintf('9 - Find probability given x or z\n')
    fprintf('10 - Find x or z given probability\n')
    fprintf('11 - Quit\n')
    
    %FOR FUTURE REFERENCE:
    %every input is taken as a string. That way, it can be fully evaluated
    %easier, and there are no input errors
    %(Evaluate using strcmpi and strprop usually)

    Input_Value = input('\nPlease enter the number you would like to do:','s');
    
    %checking if string has letters
    
    if sum(isstrprop(Input_Value,'alpha')) > 0
        fprintf('The input must be a number');
        Input_Value = '12';
    end
    
    Input_Value = str2double(Input_Value);  
    
    %Getting stats for data(if data is inputted)
    
    if isempty(Inputted_Data) == false
        [Stat_Mean,Stat_Median,Stat_Mode,Stat_Var,Stat_Std,Stat_Min,Stat_Max,Stat_Count]...
            = mystat(Inputted_Data);
    end


    %Menu options
    
    switch Input_Value
        case 1
            User_Name = UserName(User_Name);
        case 2
            Inputted_Data = LoadFile(Inputted_Data);
        case 3
            Inputted_Data = ClearData(Inputted_Data);
        case 4
            Output_File_Name = OutputFileName(Output_File_Name);
        case 5
            fit = false;
            StatHistoPlot(Inputted_Data,fit);
        case 6
            fit = true;
            StatHistoPlot(Inputted_Data,fit);
        case 7
            ProbabilityPlots(Inputted_Data);
        case 8
            [User_Dist_Opinion,User_Name,Output_File_Name] = Statistic_Output...
    (Inputted_Data,User_Dist_Opinion,Stat_Mean,Stat_Median,Stat_Mode,Stat_Var,...
    Stat_Std,Stat_Min,Stat_Max,Stat_Count,User_Name,Output_File_Name);
        case 9
            [Stat_Probability,User_Dist_Opinion] = ...
                ProbabilityFinder(Stat_Mean,Stat_Std,Inputted_Data,User_Dist_Opinion);
        case 10
            [Value_X_Found,Value_Z_Found,User_Dist_Opinion] = ...
                PointFinder(Stat_Mean,Stat_Std,Inputted_Data,User_Dist_Opinion);
        case 11
            fprintf('\nGoodbye,%s,Thanks for using this program!\n',User_Name)
        otherwise
            fprintf('\nThe inputted value was not between 1 and 11')
    end
end

