# Broken Rotor Fault Classification with K-Nearest Neighbors (KNN) in MATLAB

This project involves classifying broken rotor faults in induction motors using multiple CSV files containing fault data. The classification is performed using the K-Nearest Neighbors (KNN) algorithm, which was found to offer the best accuracy among the models tested.

## Table of Contents

- [Project Overview](#project-overview)
- [Broken Rotor Faults](#broken-rotor-faults)
  - [Causes of Broken Rotor Faults](#causes-of-broken-rotor-faults)
  - [Effects of Broken Rotor Faults](#effects-of-broken-rotor-faults)
- [Data Import](#data-import)
- [Model Training](#model-training)
- [Model Prediction](#model-prediction)
- [Usage](#usage)
- [Files](#files)
- [Requirements](#requirements)

## Project Overview

The goal of this project is to classify broken rotor faults in induction motors using a machine learning model. The dataset includes various conditions such as broken bars and cracks in the rotor, as well as normal rotor conditions. The KNN model was selected based on its accuracy during the model evaluation phase.

## Broken Rotor Faults

Broken rotor faults are serious issues in induction motors and can lead to significant performance degradation. Common broken rotor faults include:

- **Broken Bars**: Occur when one or more bars in the rotor break.
- **Cracks in the Rotor**: Structural cracks that develop in the rotor over time.

### Causes of Broken Rotor Faults

- **Mechanical Stress**: Repeated start/stop cycles and heavy loads can cause mechanical fatigue.
- **Overheating**: Excessive temperatures can weaken the rotor bars, making them prone to breakage.
- **Manufacturing Defects**: Poor manufacturing processes can introduce flaws that lead to cracks and breaks.
- **Electrical Stress**: High currents can create thermal and mechanical stress leading to rotor faults.

### Effects of Broken Rotor Faults

- **Reduced Efficiency**: Broken rotor faults cause imbalance and reduce the motor's efficiency.
- **Increased Vibration**: Faults can create uneven forces, leading to excessive vibration.
- **Noise**: Faults can produce abnormal noise during operation.
- **Reduced Torque**: Faults can lead to a decrease in the motor's torque output, affecting performance.

## Data Import

The first step is to import the CSV files containing the broken rotor fault data into MATLAB and merge them into a single table.

```matlab
data1 = readtable('D:\EM_Project\broken_bar_fault.csv');  % Read the CSV file
data2 = readtable('D:\EM_Project\normal_rotor.csv');  % Read the CSV file
data3 = readtable('D:\EM_Project\cracked_rotor_fault_1.csv');  % Read the CSV file
data4 = readtable('D:\EM_Project\cracked_rotor_fault_2.csv');  % Read the CSV file
data5 = readtable('D:\EM_Project\cracked_rotor_fault_3.csv');  % Read the CSV file

merged_table = vertcat(data1, data5, data4, data3, data2);
```

## Model Training
The merged data table is then used to train a classification model using MATLAB's Classification Learner app. During this process, various models are tested, and the KNN model is found to offer the highest accuracy. The trained KNN model is exported to the MATLAB workspace as KNN_Model.

## Model Prediction
To make predictions on new data using the trained KNN model, the following commands are used:
```matlab
data = readtable('D:\EM_Project\Test_Data.csv');
[yfit, scores] = KNN_Model.predictFcn(data);
```
Here, data is the new dataset on which predictions are to be made. The output yfit contains the predicted class labels, and scores contains the confidence scores for each prediction.

## Usage
-Import the necessary CSV files and merge them into a single table.
- Train the classification model using the merged table in the Classification Learner app.
- Export the trained KNN model to the workspace.
- Use the provided code to make predictions on new data.
## Files
- `broken_bar_fault.csv`: Data for broken bar faults.
- `normal_rotor.csv`: Data for normal rotor conditions.
- `cracked_rotor_fault_1.csv`: Data for cracked rotor faults (test 1).
- `cracked_rotor_fault_2.csv`: Data for cracked rotor faults (test 2).
- `cracked_rotor_fault_3.csv`: Data for cracked rotor faults (test 3).
- `Test_Data.csv`: New data for prediction.
## Requirements
- MATLAB with the Statistics and Machine Learning Toolbox.
- CSV files containing the broken rotor fault data.

This project demonstrates how to import, merge, and classify broken rotor fault data using the KNN algorithm in MATLAB. The KNN model is selected based on its accuracy and is used to make predictions on new data.
