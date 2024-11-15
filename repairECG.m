function T = repairECG(T)
	% Fill outliers
	T = filloutliers(T,"linear","mean","ThresholdFactor",7);
end