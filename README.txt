### README.txt ###

## Executing the program ##

The MATLAB programs in this directory is for predicting prosodic features (written in tt1.fss) and the value of R-Squared (measure of prediction quality). Following steps can be followed to get the result.

1. Add this directory to the MATLAB.
2. Check that the list of audio files in all '.tl' files are located in 'stereo' folder.
3. Run run.m

The program will find the value of R-squared for all types of prosodic features (as in .fss file) and also the prediction result in a matrix form which can be plotted to compare with the actual value.

run.m depends on the programs in 'midlevel-master' and 'voicebox' directory.


## Understanding the result ##

Prediction results are stored in MATLAB struct array. For example: maleVO contains the result for volume prediction. Structure of the array is described in the run.m file.
Each element has two parts, 'model' and 'result'. 'model' contains all the information about the linear model (including the value of R-Squared) and 'result' is a 2-column matrix. First column is the actual data and the second one is the predictive data.
 
For example:

>> maleVO(1).model   %% will print the linear model information.
>> maleVO(1).result  %% will give the actual and prediction result for 1600 to 3200 time window


## Plotting for comparing the result

For example, to compare the result for volume feature in 1600 to 3200 window, following commands can be given:

>> mat = maleVO(1).result;
>> plot(mat,'DisplayName','mat');
>> legend('Actual Data', 'Prediction');