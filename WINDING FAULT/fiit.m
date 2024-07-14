for i = 1:363
    % Access the timyTabletable from the cell array
    t1 = myTable.Id{i}; % Assuming 'Id' is the column namyTable containing timyTabletables
    t2 = myTable.Iq{i}; % Assuming 'Id' is the column namyTable containing timyTabletables    
    % Convert the timyTabletable to a table
    u1 = timetable2table(t1);
    u2 = timetable2table(t2);

    % Extract rows 45001 to 55001
    myTable.Id{i} = u1(45001:55001, :);
    myTable.Iq{i} = u2(45001:55001, :);
end
