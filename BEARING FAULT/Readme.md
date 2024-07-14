# Bearing Fault Classification with K-Nearest Neighbors (KNN) in MATLAB
This project involves classifying bearing faults using multiple CSV files containing bearing vibration data. The classification is performed using the K-Nearest Neighbors (KNN) algorithm, which was found to offer the best accuracy among the models tested.

## Table of Contents
- Project Overview
- Data Import
- Model Training
- Model Prediction
- Usage
- Files
- Requirements

## Project Overview
The goal of this project is to classify different types of bearing faults using a machine learning model. The dataset includes various fault conditions such as inner race faults, outer race faults, and roller element faults, as well as normal bearing conditions. The KNN model was selected based on its accuracy during the model evaluation phase.

## Data Import
The first step is to import the CSV files containing the bearing fault data into MATLAB and merge them into a single table.
      
    data1 = readtable('D:\EM_Project\inner_race_fault.csv');  % Read the CSV file
    data2 = readtable('D:\EM_Project\Normal_Bearing.csv');  % Read the CSV file
    data3 = readtable('D:\EM_Project\outer_race_fault_test_2.csv');  % Read the CSV file
    data4 = readtable('D:\EM_Project\outer_race_fault_test_3.csv');  % Read the CSV file
    data5 = readtable('D:\EM_Project\roller_element_fault.csv');  % Read the CSV file
## Model Training
The merged data table is then used to train a classification model using MATLAB's Classification Learner app. During this process, various models are tested, and the KNN model is found to offer the highest accuracy. The trained KNN model is exported to the MATLAB workspace as KNN_Model.

## Model Prediction
To make predictions on new data using the trained KNN model, the following commands are used:

    data = readtable('D:\EM_Project\Test_Data.csv');
    [yfit, scores] = KNN_Model.predictFcn(data);

Here, data is the new dataset on which predictions are to be made. The output yfit contains the predicted class labels, and scores contains the confidence scores for each prediction.

## Usage
- Import the necessary CSV files and merge them into a single table.
- Train the classification model using the merged table in the Classification Learner app.
- Export the trained KNN model to the workspace.
- Use the provided code to make predictions on new data.
## Files
- inner_race_fault.csv: Vibration data for inner race faults.
- Normal_Bearing.csv: Vibration data for normal bearing conditions.
- outer_race_fault_test_2.csv: Vibration data for outer race faults (test 2).
- outer_race_fault_test_3.csv: Vibration data for outer race faults (test 3).
- roller_element_fault.csv: Vibration data for roller element faults.
- Test_Data.csv: New data for prediction.

## Requirements
- MATLAB with the Statistics and Machine Learning Toolbox.
- CSV files containing the bearing fault data.
This project demonstrates how to import, merge, and classify bearing fault data using the KNN algorithm in MATLAB. The KNN model is selected based on its accuracy and is used to make predictions on new data.
merged_table = vertcat(data1, data5, data4, data3, data2);
 
