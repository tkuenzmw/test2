function figureHandle = plotfunction(ecgData)
%
arguments
    ecgData timetable
end

figureHandle = figure();

subplot(2,3,1:3)
[time, signal] = getNormedEcgRange(ecgData,0,60);
makeSubplot(time, signal, "All data");

subplot(2,3,4);
[time, signal] = getNormedEcgRange(ecgData,0,5);
makeSubplot(time, signal, "First 5 seconds");

subplot(2,3,5);
[time, signal] = getNormedEcgRange(ecgData,30,35);
makeSubplot(time, signal, "Middle 5 seconds");

subplot(2,3,6);
[time, signal] = getNormedEcgRange(ecgData,54,59);
makeSubplot(time, signal, "Last 5 seconds");
end

%% Local functions
function [time, normSignal] = getNormedEcgRange(ecgData, tBegin, tEnd)
timeRange = timerange(seconds(tBegin),seconds(tEnd));
signal = ecgData.Signal_uV(timeRange);
time = ecgData.Time(timeRange);
normSignal = signal ./ max(signal);
normSignal = normSignal - mean(normSignal);
end

function makeSubplot(time, signal, titleText)
plot(time, signal);
xlabel("Time (s)")
ylabel("Signal (norm.)")
title(titleText)
end