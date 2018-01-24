function d = NMP_getDiveSites(imageFolder)

d = dir(imageFolder);
d = d(~ismember({d.name},{'.','..'}));
d = d([d.isdir]);
