function TT = HealthCheck(mfile)
filename = mfile; % Replace this with your filename

% Check if the filename starts with any of the specified characters
if startsWith(filename, '0')
    TT="healthy";
elseif startsWith(filename, '1')
    TT="H";
elseif startsWith(filename, '2')
    TT="H";
elseif startsWith(filename, '3')
   TT="H";
elseif startsWith(filename, '4')
   TT="L";
elseif startsWith(filename, '5')
    TT="L";
elseif startsWith(filename, '6')
    TT="L";
else
    disp('Ffffffffffffuuuuuuuuuuuuuuuuuu');
end
end
