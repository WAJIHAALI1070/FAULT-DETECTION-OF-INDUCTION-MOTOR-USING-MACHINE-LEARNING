function [featureTable,outputTable] = diagnosticFeatures(inputData)
%DIAGNOSTICFEATURES recreates results in Diagnostic Feature Designer.
%
% Input:
%  inputData: A table or a cell array of tables/matrices containing the
%  data as those imported into the app.
%
% Output:
%  featureTable: A table containing all features and condition variables.
%  outputTable: A table containing the computation results.
%
% This function computes signals:
%  I_tsproc/I
%
% This function computes features:
%  I_sigstats/SINAD
%  I_sigstats/THD
%  I_tsproc_sigstats/ClearanceFactor
%  I_tsproc_sigstats/CrestFactor
%  I_tsproc_sigstats/ImpulseFactor
%  I_tsproc_sigstats/SINAD
%  I_tsproc_sigstats/THD
%
% Organization of the function:
% 1. Compute signals/spectra/features
% 2. Extract computed features into a table
%
% Modify the function to add or remove data processing, feature generation
% or ranking operations.

% Auto-generated by MATLAB on 11-Dec-2023 23:01:36

% Create output ensemble.
outputEnsemble = workspaceEnsemble(inputData,'DataVariables',"I",'ConditionVariables',"health");

% Reset the ensemble to read from the beginning of the ensemble.
reset(outputEnsemble);

% Append new signal or feature names to DataVariables.
outputEnsemble.DataVariables = unique([outputEnsemble.DataVariables;"I_tsproc";"I_sigstats";"I_tsproc_sigstats"],'stable');

% Set SelectedVariables to select variables to read from the ensemble.
outputEnsemble.SelectedVariables = "I";

% Loop through all ensemble members to read and write data.
while hasdata(outputEnsemble)
    % Read one member.
    member = read(outputEnsemble);

    % Get all input variables.
    I = readMemberData(member,"I",["Time","I"]);

    % Initialize a table to store results.
    memberResult = table;

    %% TimeSeriesProcessing
    try
        % Apply time series processing steps.
        x = I.I;
        t = I.Time;
        % Detrend the signal.
        order = 1;
        x = detrend(x, order, 'omitnan', 'SamplePoints', t);

        % Package computed signal into a table.
        I_tsproc = table(t,x,'VariableNames',{'Time','I'});
    catch
        % Package computed signal into a table.
        data = NaN(1,2);
        I_tsproc = array2table(data,'VariableNames',{'Time','I'});
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({I_tsproc},'VariableNames',{'I_tsproc'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = I.I;
        SINAD = sinad(inputSignal);
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [SINAD,THD];

        % Package computed features into a table.
        featureNames = {'SINAD','THD'};
        I_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Package computed features into a table.
        featureValues = NaN(1,2);
        featureNames = {'SINAD','THD'};
        I_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({I_sigstats},'VariableNames',{'I_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = I_tsproc.I;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        SINAD = sinad(inputSignal);
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,SINAD,THD];

        % Package computed features into a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','SINAD','THD'};
        I_tsproc_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Package computed features into a table.
        featureValues = NaN(1,5);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','SINAD','THD'};
        I_tsproc_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({I_tsproc_sigstats},'VariableNames',{'I_tsproc_sigstats'})]; %#ok<AGROW>

    %% Write all the results for the current member to the ensemble.
    writeToLastMemberRead(outputEnsemble,memberResult)
end

% Gather all features into a table.
selectedFeatureNames = ["I_sigstats/SINAD","I_sigstats/THD","I_tsproc_sigstats/ClearanceFactor","I_tsproc_sigstats/CrestFactor","I_tsproc_sigstats/ImpulseFactor","I_tsproc_sigstats/SINAD","I_tsproc_sigstats/THD"];
featureTable = readFeatureTable(outputEnsemble,'Features',selectedFeatureNames);

% Set SelectedVariables to select variables to read from the ensemble.
outputEnsemble.SelectedVariables = unique([outputEnsemble.DataVariables;outputEnsemble.ConditionVariables;outputEnsemble.IndependentVariables],'stable');

% Gather results into a table.
outputTable = readall(outputEnsemble);
end
