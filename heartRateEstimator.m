function HR = heartRateEstimator(T)
%HEARTRATEESTIMATOR detects and counts peaks /assumes 1min recordings

% Find local maxima
maxIndices = islocalmax(T.Signal_uV,"MinProminence",1,"SamplePoints",T.Time);

% Calculate Heart Rate
HR = sum(maxIndices);
end

