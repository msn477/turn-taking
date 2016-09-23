function nmonster = makeNMonster(tracklistFile, fsspecFile)

% inputs:
%   trackspec: includes au pathname plus track (left or right)
%   fsspec: feature set specification
% output:
%   nmonster is a normalized large 2-dimensional array
%    where every row is a timepoint, 20ms apart, starting at 20ms
%    and every column a feature. 

flist = getfeaturespec(fsspecFile);
trackspecs = gettracklist(tracklistFile);

totalMonster = makeMultiTrackMonster(trackspecs, flist);

% downsample; convert from every 10ms to every 20ms to same time and space
totalMonster = totalMonster(2:2:end,:); 

tic
for col=1:length(flist)
  nmeans(col) = mean(totalMonster(:,col));
  nstds(col) = std(totalMonster(:,col));
  nmonster(:,col) = (totalMonster(:,col) - nmeans(col)) / nstds(col);
end
fprintf('  Time spent to normalize: ');
toc
end
