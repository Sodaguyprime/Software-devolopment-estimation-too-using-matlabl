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

disp(['KLOC: ', num2str(KLOC)]);
disp(['Team Size: ', num2str(TeamSize)]);
disp(['Duration: ', num2str(duration)]);

% Upload Size Decision
Next_choise = input('would you like to calculate the upload time over provided bandwidth?, Enter 1 for yes and 2 for no:  ');
if Next_choise == 1
    fprintf('\nEstimated software size (S-Calc) = %.2f MB\n', Size_calc);
    disp('Use this size for upload time over provided bandwidth?');
    S_Choice = input('1 for Yes, 2 for No: ');
    if S_Choice == 1
        File_size = Size_calc;
    else
     File_size = input('Insert your software size in MB: ');
    end
    bandwidth = input('Enter internet speed in Mbps: ');
[uploadtime, TimMin] = calculateUploadTime(File_size, bandwidth);
fprintf('Effort: %.2f Person-Months\n', effort);
fprintf('Duration: %.2f Months\n', duration);
fprintf('Team Size: %.2f People\n', TeamSize);
fprintf('Using file size: %.2f MB\n', File_size);
fprintf('Estimated Upload Time: %.2f Minutes (%.2f Seconds)\n', TimMin, uploadtime);
else 
    fprintf('Effort: %.2f Person-Months\n', effort);
    fprintf('Duration: %.2f Months\n', duration);
    fprintf('Team Size: %.2f People\n', TeamSize);
    File_size = Size_calc;
    fprintf('Using file size: %.2f MB\n', File_size);
end
end