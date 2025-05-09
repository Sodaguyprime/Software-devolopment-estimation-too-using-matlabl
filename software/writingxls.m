function writingxls(Software,filename)
headers = fieldnames(Software)';
values = struct2cell(Software)';

%checking if file exists already so it isn't overwritten:
if isfile(filename)
    existingTable = readcell(filename); %reads full content
    if isequal(existingTable(1,:), headers) %will append only if all headers match
        outputData = [existingTable; values];
    else
        warning('Headers dont match, overwriting file');
        outputData = [headers, values];
    end
else
    outputData = [headers; values];
end

xlswrite(filename, outputData);
end

