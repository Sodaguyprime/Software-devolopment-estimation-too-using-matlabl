function writingandreading(Software,filename)
headers = fieldnames(Software)';
values = struct2cell(Software)';
outputData = [headers; values];
xlswrite(filename, outputData);
end

