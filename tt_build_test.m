function S = tt_build_test(trainingTracklistFile, testTracklistFile, fsspecFile)

% inputs:
%  trainingTracklistFile is the file containing the list of conversations
%    for training purpose.
%  testTrackFile is the file containing the list of conversations
%    for testing.
%  fsspecFile is the file containing the list of features to be 
%    trained and tested.
% output:
%  S is a struct array where each of the elements contains
%  the information for each linear model created by using each pair 
%  of past and future prosodic features described in fsspecFile.
%
% Example .fss file
% ## volume
% vo -3200 to -1600 inte
% vo  1600 to  3200 inte

% vo -1600 to  -800 inte
% vo   800 to  1600 inte
% This is a .fss file for two linear models
%
% Example Run: 
%  Male = tt-build-test('m_training.tl', 'm_test.tl', 'features.fss')

% Accessing information from struct array:
%  For model info, do Male(i).model where i can be from 1 to length(Male).
%  For results, do Male(i).result which is a two dimensional array. First
%   column is the original value and the second one is the predicted value
%   for the corresponding prosodic feature in the linear model
%
% M Hassan, UTEP, August, 2016

tic
trainingMonster = makeNMonster(trainingTracklistFile, fsspecFile);
testMonster = makeNMonster(testTracklistFile, fsspecFile);
nModel = length(trainingMonster(1, :)) / 2; % number of linear models
S = struct();

for i = 1 : nModel
    X = trainingMonster(:,1:2:end);
    y = trainingMonster(:,i*2);
    mdl = fitlm(X, y);
    xTest = testMonster(:,1:2:end);
    yTest = testMonster(:,i*2);
    ypre = feval(mdl, xTest);
    comparison = [yTest ypre];
    S(i).model = mdl;
    S(i).result = comparison;
end
fprintf('  Time spent: ');
toc

end