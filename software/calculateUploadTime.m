function [uploadtime, TimMin] = calculateUploadTime(File_size, bandwidth)
% Calculates the upload time given file size and bandwidth

File_sizeMb = File_size * 8; % MB to Mb
uploadtime = File_sizeMb / bandwidth; % seconds
TimMin = uploadtime / 60; % minutes
end
