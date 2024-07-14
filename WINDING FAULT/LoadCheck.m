function TT = LoadCheck(mfile)
filename = mfile; % Replace this with your filename

% Check if the filename starts with any of the specified characters
if endsWith(filename, '000.csv')
    TT="No load";
elseif endsWith(filename, '100.csv')
    TT="Full Load";
elseif endsWith(filename, '050.csv')
    TT="Half Load";
else
    disp('Ffffffffffffuuuuuuuuuuuuuuuuuu');
end
end
