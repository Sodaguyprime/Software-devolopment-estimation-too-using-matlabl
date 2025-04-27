function Size_calc = calculateSize(LOC)
% Calculates the estimated size of the software based on LOC
sizeperLOC_MB = 0.05; % average size per LOC
Size_calc = LOC * sizeperLOC_MB;
end
