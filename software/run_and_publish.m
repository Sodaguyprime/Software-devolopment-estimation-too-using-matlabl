% This script runs Estimation_upload and then publishes it as a report
Estimation_upload(); %running main program

% Publish the report version
opts = struct('format','pdf','outputDir','Records');
publish('Estimation_upload.m', opts);

disp('PDF report has been generated in the "Reports" folder.');
