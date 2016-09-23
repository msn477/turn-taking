function nmonster = makeMonster(tracklistFile,fsspecFile)

trackspecs = gettracklist(tracklistFile);
flist = getfeaturespec(fsspecFile);

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