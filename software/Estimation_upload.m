function Estimation_upload()
clc;
clear;

% Inputs
LOC = input('Enter estimated lines of code (LOC): ');
disp('Select project type:      1-Organic    2-Semi-detached    3-Embedded');
projectType = input('Enter project type number: ');

% Calculate Size
Size_calc = calculateSize(LOC);

% COCOMO Estimation
[effort, duration, TeamSize, KLOC] = cocomoEstimation(LOC, projectType);

%               Assigning strings based on the project selection type
switch projectType
    case 1
        projectType = 'Organic';
    case 2
        projectType = 'Semi-detached';
    case 3
        projectType = 'Embedded';
    otherwise
        error('None chosen?');
end
%End of ProjectType sleection for output file


% Upload Size Decision
Next_choise = input('would you like to calculate the upload time over provided bandwidth?, Enter 1 for yes and 2 for no:  ');

% This section determines the size of the software and wether or not to
% calculate the upload time.
if Next_choise == 1
    fprintf('\nEstimated software size (S-Calc) = %.2f MB\n', Size_calc); %prints the size of the Software
    disp('Use this size for upload time over provided bandwidth?'); 
    S_Choice = input('1 for Yes, 2 for No: ');
    if S_Choice == 1
        File_size = Size_calc;
    else
        File_size = input('Insert your software size in MB: ');
    end
    bandwidth = input('Enter internet speed in Mbps: ');
    [uploadtime, TimMin] = calculateUploadTime(File_size, bandwidth);
    fprintf('Estimated Upload Time: %.2f Minutes (%.2f Seconds)\n', TimMin, uploadtime);
    Software.TimeMin = TimMin;  
else
    %if no software size is entered then use default calculated
    File_size = Size_calc;
    fprintf('Duration: %.2f Months\n', duration);
end

% Assign shared fields after the block
Software.effort = effort;
Software.duration = duration;
Software.Teamsize = TeamSize;
Software.File_size = File_size;
Software.KLOC = KLOC;
Software.type = projectType;
Software.timestamp = datestr(now, 'yyyy-mm-dd HH:MM:SS');

% Writing to an output excel file
writingandreading(Software, 'Records.xlsx');

disp('Data has been recorded in output.xls');
end