rows = [22 100021];
files = dir(fullfile(pwd, '*c50c100.csv'));
filename = files(1).name;
opts = detectImportOptions(filename);
opts.VariableNamingRule = 'preserve';  % Preserve variable names
opts.DataLines = rows;
data = readtable(filename, opts);  % Read the CSV file
data.Properties.VariableNames(1:5) = {'Time', 'lf', 'I1', 'I2', 'I3'};
%plot(data.Time, data.I1, 'r', data.Time, data.I2, 'g', data.Time, data.I3, 'b',data.Time, id, 'm', data.Time, iq, 'c');

polarplot(100*pi*data.Time,iq);
polarplot(100*pi*data.Time,id);
