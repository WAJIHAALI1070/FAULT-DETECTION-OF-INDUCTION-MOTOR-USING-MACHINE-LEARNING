# Winding Fault Classification with K-Nearest Neighbors (KNN) in MATLAB

This project involves classifying winding faults in electric motors using multiple CSV files containing winding fault data. The classification is performed using the K-Nearest Neighbors (KNN) algorithm, which was found to offer the best accuracy among the models tested.

## Table of Contents

- [Project Overview](#project-overview)
- [Winding Faults](#winding-faults)
  - [Causes of Winding Faults](#causes-of-winding-faults)
  - [Effects of Winding Faults](#effects-of-winding-faults)
- [Data Import](#data-import)
- [Model Training](#model-training)
- [Model Prediction](#model-prediction)
- [Usage](#usage)
- [Files](#files)
- [Requirements](#requirements)

## Project Overview

The goal of this project is to classify different types of winding faults in electric motors using a machine learning model. The dataset includes various fault conditions such as shorted turns, open circuits, and inter-turn faults, as well as normal winding conditions. The KNN model was selected based on its accuracy during the model evaluation phase.

## Winding Faults

Winding faults are common issues in electric motors and can severely impact their performance and longevity. Some common winding faults include:

- **Shorted Turns**: Occur when the insulation between turns of the winding breaks down, causing a short circuit.
- **Open Circuits**: Occur when a break in the winding results in an open circuit.
- **Inter-Turn Faults**: Occur when there is an insulation failure between turns within the same winding.

### Causes of Winding Faults

- **Overheating**: Excessive heat can degrade the insulation material, leading to short circuits or open circuits.
- **Mechanical Stress**: Vibration and mechanical forces can damage the windings and insulation.
- **Electrical Stress**: Overvoltage conditions can puncture the insulation, causing inter-turn faults.
- **Environmental Factors**: Moisture, chemicals, and dust can deteriorate insulation over time.

### Effects of Winding Faults

- **Increased Power Loss**: Faults cause increased resistance and power loss, reducing the motor's efficiency.
- **Reduced Torque**: Faults can lead to uneven magnetic fields, reducing the motor's torque output.
- **Overheating**: Faults can cause localized heating, further degrading the insulation and leading to more severe faults.
- **Vibration and Noise**: Faults can create imbalance and misalignment, leading to increased vibration and noise.

## Data Import

The first step is to import the CSV files containing the winding fault data into MATLAB and merge them into a single table.

```matlab 
data1 = readtable('D:\EM_Project\shorted_turns_fault.csv');  % Read the CSV file
data2 = readtable('D:\EM_Project\normal_winding.csv');  % Read the CSV file
data3 = readtable('D:\EM_Project\open_circuit_fault.csv');  % Read the CSV file
data4 = readtable('D:\EM_Project\inter_turn_fault_1.csv');  % Read the CSV file
data5 = readtable('D:\EM_Project\inter_turn_fault_2.csv');  % Read the CSV file
merged_table = vertcat(data1, data5, data4, data3, data2); 
```

### Model Training
The merged data table is then used to train a classification model using MATLAB's Classification Learner app. During this process, various models are tested, and the KNN model is found to offer the highest accuracy. The trained KNN model is exported to the MATLAB workspace as KNN_Model.

### Model Prediction
To make predictions on new data using the trained KNN model, the following commands are used:

```matlab
data = readtable('D:\EM_Project\Test_Data.csv');
[yfit, scores] = KNN_Model.predictFcn(data);
```
Here, data is the new dataset on which predictions are to be made. The output yfit contains the predicted class labels, and scores contains the confidence scores for each prediction.

### Usage
+ Import the necessary CSV files and merge them into a single table.
+ Train the classification model using the merged table in the Classification Learner app.
+ Export the trained KNN model to the workspace.
+ Use the provided code to make predictions on new data.
### Files
+ `shorted_turns_fault.csv`: Data for shorted turns faults.
+ `normal_winding.csv`: Data for normal winding conditions.
+ `open_circuit_fault.csv`: Data for open circuit faults.
+ `inter_turn_fault_1.csv`: Data for inter-turn faults (test 1).
+ `inter_turn_fault_2.csv`: Data for inter-turn faults (test 2).
+ `Test_Data.csv`: New data for prediction.
### Requirements
- MATLAB with the Statistics and Machine Learning Toolbox.
- CSV files containing the winding fault data.

This project demonstrates how to import, merge, and classify winding fault data using the KNN algorithm in MATLAB. The KNN model is selected based on its accuracy and is used to make predictions on new data.
