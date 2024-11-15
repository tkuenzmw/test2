function tests = plotfunctionTest
%plotfunctionTest - test suite for plotfunction.m
tests = functiontests(localfunctions);
end

%% Test Functions
function testReturnsGraphicsHandle(testCase)
testCase.TestData.figureHandle = plotfunction(testCase.TestData.timetable);
assert(isgraphics(testCase.TestData.figureHandle));
end

function testHasCorrectNumberOfPanels(testCase)
testCase.TestData.figureHandle = plotfunction(testCase.TestData.timetable);
npanels = numel(testCase.TestData.figureHandle.Children);
assert(npanels == 4);
end

%% Optional file fixtures  
function setupOnce(testCase)  % do not change function name
tempT = load("testdata.mat");
testCase.TestData.timetable = tempT.T;
testCase.TestData.figureHandle = [];
end

function teardown(testCase)  % do not change function name
close(testCase.TestData.figureHandle);
end