%data1 = readtable('D:\EM_Project\inner_race_fault.csv');  % Read the CSV file
%data2 = readtable('D:\EM_Project\Normal_Bearing.csv');  % Read the CSV file
%data3 = readtable('D:\EM_Project\outer_race_fault_test_2.csv');  % Read the CSV file
%data4 = readtable('D:\EM_Project\outer_race_fault_test_3.csv');  % Read the CSV file
%data5 = readtable('D:\EM_Project\roller_element_fault.csv');  % Read the CSV file
%merged_table = vertcat(data1,data5,data4,data3,data2);
%Once, we have the merged table, this table undergoes classification
%learner and we obtain our KNN model, or we can obtain SVM model to obtain
%highest accuracy, once it is exported to out workspace, run the following
%commands

data = readtable('D:\EM_Project\Test_Data.csv');
[yfit,scores] = KNN_Model.predictFcn(data);
