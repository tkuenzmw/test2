function T = importECG(filename)
%IMPORTFILE Import ECG data from a csv file
%  T = IMPORTFILE(FILENAME) reads data from text file FILENAME for the
%  default selection.  Returns the data as a timetable.

% Set up the Import Options and import the data
dataLines = [2, Inf];
opts = delimitedTextImportOptions("NumVariables", 2);
% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";
% Specify column names and types
opts.VariableNames = ["Time", "Signal_uV"];
opts.VariableTypes = ["double", "double"];
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
T = readtable(filename, opts);
T.Time = seconds(T.Time);
T = table2timetable(T);
T = repairECG(T); % uncomment this to add the preprocessing step
end