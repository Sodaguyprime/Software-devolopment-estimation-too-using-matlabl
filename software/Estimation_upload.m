function Estimation_upload()
clc;
disp ('Size, time, effort, duration estimation. Upload Time.');

% taking Inputs & project type
LOC = input('Enter estimated lines of code (LOC) : ');
disp('Select project type: 1-organic 2-Semi-detached 3-Embedded');
projectType = input('Enter project type number: ');

%estimating software size
sizeperLOC_MB = 0.05; %avg size per LOC
Size_calc = LOC * sizeperLOC_MB;

% COCOMO coefficients
c=2.5;
switch projectType
    case 1
        a = 2.4; b = 1.05 ; d = 0.38;
    case 2 
        a = 3.0; b = 1.12; d= 0.35;
    case 3
        a=3.6; b = 1.20; d =0.32;
    otherwise
        error('Invalid project type.');
end
% calculations
KLOC = LOC/1000;
effort = a*( KLOC^b); % in person-month
duration = c * (effort^d); % months
TeamSize = effort / duration;
disp(KLOC);
disp(TeamSize);
disp(duration);

% here we start with the upload speed of the software

% checking if size should be calculated by calculated size or user-related
fprintf('\nEstimated software size (S-Calc) = %.2f MB\n', Size_calc);
disp('Use this size for upload time over provided bandwidth?');
S_Choice = input('1 for Yes, 2 for no');
if S_Choice == 1
    File_size = S_choice
else
    File_size = input ('Insert your software size');
% otherwise
%     error('Invalid choice, choose 1 or 2');
end
bandwidth = input('Enter internet speed in Mbps: ');

%  upload time calculation
File_sizeMb = File_size * 8; % MB to Mb
uploadtime = File_sizeMb / bandwidth;
TimMin = uploadtime / 60; % seconxds to mins

% Displaying esults:
    fprintf('Effort: %.2f Person-Months\n', effort);
    fprintf('Duration: %.2f Months\n', duration);
    fprintf('Team Size: %.2f People\n', TeamSize);
    fprintf('Using file size: %.2f MB\n', File_sizeMb);
    fprintf('Estimated Upload Time: %.2f Minutes (%.2f Seconds)\n', TimMin, uploadtime);

% Plotting time vs Bandwidth
