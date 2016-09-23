% After running this script, linear models for INTERLOCUTORS will be 
%  stored in both "Male" and "Female" struct array from index 25 to 48.
%  Array indices for each prosodic feature:
%   from 25 to 30 - Volume
%   from 31 to 36 - Pitch lowness
%   from 37 to 42 - Pitch highness
%   from 43 to 48 - Speaking rate
% For example, Male(25) to Male(30) contains the result for Volume feature
%
% Each of the six linear models for each prosodic feature are for six 
%  different future time in the conversation. Details are below for each
%  features.
%  
% Linear model     Time window
% 1st               1600 to 3200
% 2nd               800 to 1600
% 3rd               400 to 800
% 4th               200 to 400
% 5th               100 to 200
% 6th               0 to 100
% For example: Male(25) has the result for Volume feature for 1600 to 3200
% window, Male(26) has the result for 800 to 1600 window.

% Getting struct array
if ~exist('Male', 'var')
    Male = tt_build_test('m_training.tl', 'm_test.tl', 'tt1.fss');
end

if ~exist('Female', 'var')
    Female = tt_build_test('f_training.tl', 'f_test.tl', 'tt1.fss');
end

% Getting result for each features
maleVO = Male(25:30);
maleTL = Male(31:36);
maleTH = Male(37:42);
maleSR = Male(43:48);

femaleVO = Female(25:30);
femaleTL = Female(31:36);
femaleTH = Female(37:42);
femaleSR = Female(43:48);

% Getting the values of Rsquared
rsquaredMaleVO = [];
rsquaredMaleTL = [];
rsquaredMaleTH = [];
rsquaredMaleSR = [];
rsquaredFemaleVO = [];
rsquaredFemaleTL = [];
rsquaredFemaleTH = [];
rsquaredFemaleSR = [];

for i = length(maleVO):-1:1
    rsquaredMaleVO = vertcat(rsquaredMaleVO, maleVO(i).model.Rsquared.Ordinary);
    rsquaredMaleTL = vertcat(rsquaredMaleTL, maleTL(i).model.Rsquared.Ordinary);
    rsquaredMaleTH = vertcat(rsquaredMaleTH, maleTH(i).model.Rsquared.Ordinary);
    rsquaredMaleSR = vertcat(rsquaredMaleSR, maleSR(i).model.Rsquared.Ordinary);
    
    rsquaredFemaleVO = vertcat(rsquaredFemaleVO, femaleVO(i).model.Rsquared.Ordinary);
    rsquaredFemaleTL = vertcat(rsquaredFemaleTL, femaleTL(i).model.Rsquared.Ordinary);
    rsquaredFemaleTH = vertcat(rsquaredFemaleTH, femaleTH(i).model.Rsquared.Ordinary);
    rsquaredFemaleSR = vertcat(rsquaredFemaleSR, femaleSR(i).model.Rsquared.Ordinary);
end

clear i;


