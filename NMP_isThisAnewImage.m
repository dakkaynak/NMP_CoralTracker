function [y,inds] = NMP_isThisAnewImage(imageName)

global maskFolder
% Default is it is not a new image
y = 0;

% Check if any mask for this image exists
allMasks = dir([maskFolder,'/*.mat']);
allFileNames = {allMasks.name}';
% Some masks exist for this image
inds = find(~cellfun(@isempty,(strfind(allFileNames,imageName(1:end-4)))));
if isempty(inds)
    y = 1;
end
