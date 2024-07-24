numExperiments = 2; % Up to a maximum of 10 if using the original data set
% Names of the original data files restored from the zip archive.
files = [ ...
  "struct_rs_R1.mat", ...
  "struct_r1b_R1.mat", ...
  "struct_r2b_R1.mat", ...
  "struct_r3b_R1.mat", ...
  "struct_r4b_R1.mat", ...
  ];


% Rotor conditions (that is, number of broken bars) corresponding to original data files.
health = [
  "healthy", ...
  "broken_bar_1", ...
  "broken_bar_2", ...
  "broken_bar_3", ...
  "broken_bar_4", ...
  ];

Fs_vib = 7600; % Sampling frequency of vibration signals in Hz.
Fs_elec = 50000; % Sampling frequency of electrical signals in Hz.
%Create a target folder to store the ensemble member data files that you generate next.
folder = 'data_files';
if ~exist(folder, 'dir')
  mkdir(folder);
end

%Iterate over the original data files, where each file corresponds to a given number of broken rotor bars, and construct individual ensemble member data files for each combination of load and number of broken rotor bars.
% Iterate over the number of broken rotor bars.
for i = 1:numel(health)
  fprintf('Processing data file %s\n', files(i))

  % Load the original data set stored as a struct.
  S = load(files(i));
  fields = fieldnames(S);
  dataset = S.(fields{1});

  loadLevels = fieldnames(dataset);
  % Iterate over load (torque) levels in each data set.
  for j = 1:numel(loadLevels)
    experiments = dataset.(loadLevels{j});
    data = struct;

    % Iterate over the given number of experiments for each load level.
    for k = 1:numExperiments
      signalNames = fieldnames(experiments(k));
      % Iterate over the signals in each experimental data set.
      for l = 1:numel(signalNames)
        % Experimental (electrical and vibration) data
        data.(signalNames{l}) = experiments(k).(signalNames{l});
      end

      % Operating conditions
      data.Health = health(i);
      data.Load = string(loadLevels{j});

      % Constant parameters
      data.Fs_vib = Fs_vib;
      data.Fs_elec = Fs_elec;

      % Save memberwise data.
      name = sprintf('rotor%db_%s_experiment%02d',  i-1, loadLevels{j}, k);
      fprintf('\tCreating the member data file %s.mat\n', name)
      filename = fullfile(pwd, folder, name);
      save(filename, '-v7.3', '-struct', 'data'); % Save fields as individual variables.
    end
  end
end
%% 

location = fullfile(pwd, folder);
ens = fileEnsembleDatastore(location,'.mat');
%Before you can interact with data in the ensemble, you must create functions that tell the software how to process the data files to read variables into the MATLAB workspace and to write data back to the files. For this example, use the following supplied functions.
%readMemberData — Extract requested variables stored in the file. The function returns a table row containing one table variable for each requested variable.  
%riteMemberData — Take a structure and write its variables to a data file as individual stored variables. 
ens.ReadFcn = @readMemberData;
ens.WriteToMemberFcn = @writeMemberData;
%Finally, set properties of the ensemble to identify data variables, condition variables, and the variables selected to read. These variables include ones that are not in the original data set but rather specified and constructed by readMemberData: Vib_acpi_env, the band-pass filtered radial vibration signal, and Ia_env_ps, the band-pass filtered envelope spectrum of the first-phase current signal. Diagnostic Feature Designer can read synthetic signals such as these as well.
ens.DataVariables = [...
  "Va"; "Vb"; "Vc"; "Ia"; "Ib"; "Ic"; ...
  "Vib_acpi"; "Vib_carc"; "Vib_acpe"; "Vib_axial"; "Vib_base"; "Trigger"];
ens.ConditionVariables = ["Health"; "Load"];
ens.SelectedVariables = ["Ia"; "Vib_acpi"; "Health"; "Load"];
% Add synthetic signals and spectra generated directly in the readMemberData
% function.
ens.DataVariables = [ens.DataVariables; "Vib_acpi_env"; "Ia_env_ps"];
ens.SelectedVariables = [ens.SelectedVariables; "Vib_acpi_env"; "Ia_env_ps"];
T = read(ens);
%% 

ens
T = read(ens)
app = diagnosticFeatureDesigner;
T = readall(ens)


