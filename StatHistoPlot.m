function [] = StatHistoPlot(Inputted_Data,fit)
%StatHistoPlot    Created a histogram and fitted histogram for StatFile
%                   script
%
%   StatHistoPlot Created a histogram and fitted histogram for StatFile
%                   script
% 
%   StatHistoPlot overwrites these variables:
%
%   StatHistoPlot prompts the user to input values for 
%        Bin_Numbers



    %Error Checking (if data exists)
    
    if isempty(Inputted_Data)
        fprintf('\nThere is no data to evaluate.')
    else
        
        %Initializing variable
        
        Bin_Numbers = 'letters';
        
        %Taking Bin_numbers input (and making sure its a number)
        
        while sum(isstrprop(Bin_Numbers,'alpha')) > 0
            
            fprintf('\nDo not enter anything to use Matlab''s suggested amount of bins')
            Bin_Numbers = input('\nHow many bins do you want in this histogram?','s');
            
            if sum(isstrprop(Bin_Numbers,'alpha')) > 0
                fprintf('\nThe input must be a number');
            end
        end
        
        %Deciding whether to plot with fit or not
        
        if fit == true
            
            if strcmp(Bin_Numbers,'')
                histfit(Inputted_Data);
            else
                Bin_Numbers = str2double(Bin_Numbers);
                histfit(Inputted_Data,Bin_Numbers);
            end
            
        else
        
            if strcmp(Bin_Numbers,'')
                histogram(Inputted_Data)
            else
                Bin_Numbers = str2double(Bin_Numbers);
                histogram(Inputted_Data,Bin_Numbers);
            end
        
        end
        
    end
end
        