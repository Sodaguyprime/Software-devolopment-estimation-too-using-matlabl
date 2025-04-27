function [effort, duration, TeamSize, KLOC] = cocomoEstimation(LOC, projectType)
% Calculates effort, duration, and team size based on COCOMO

c = 2.5; % duration constant
switch projectType
    case 1
        a = 2.4; b = 1.05; d = 0.38;
    case 2
        a = 3.0; b = 1.12; d = 0.35;
    case 3
        a = 3.6; b = 1.20; d = 0.32;
    otherwise
        error('Invalid project type.');
end

KLOC = LOC / 1000;
effort = a * (KLOC^b); % in person-months
duration = c * (effort^d); % months
TeamSize = effort / duration;
end
