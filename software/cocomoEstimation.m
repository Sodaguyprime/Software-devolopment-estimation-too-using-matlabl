function [effort, duration, TeamSize, KLOC] = cocomoEstimation(LOC, projectType)
% Calculates effort, duration, and team size based on COCOMO

abd = [2.4,1.05, 0.38; 3.0, 1.12, 0.35; 3.6, 1.20, 0.32];
c = 2.5; % duration constant

switch projectType
    case 1  % Organic
        row = 1;
    case 2  % Semi-detached
        row = 2;
    case 3  % Embedded
        row = 3;
    otherwise 
        error('Invalid project type');
end

a = abd(row, 1);
b = abd(row, 2);
d = abd(row, 3);


KLOC = LOC / 1000;
effort = a * (KLOC^b); % in person-months
duration = c * (effort^d); % months
TeamSize = effort / duration;
end
