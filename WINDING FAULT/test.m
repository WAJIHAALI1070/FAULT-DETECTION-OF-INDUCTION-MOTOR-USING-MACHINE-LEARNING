load("testdata.mat");%Testing data for table
load("trainedmodel.mat"); %MY Exported ML model
 % Initialize cell array to store data
%% 
result = cell(27, 2); 
for i=1:27
data=testdata(i,:);
[x,y]=diagnosticFeatures(data);
x(:, 1) = [];
[yfit,scores] = trainedModel1.predictFcn(x);
hello=yfit{1};
result{i, 1}=hello;
result{i, 2}=max(scores);
end
%%