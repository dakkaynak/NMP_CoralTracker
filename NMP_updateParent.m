function coralNumParent = NMP_updateParent(allMasks,coralInCoralParentInd,sampleDirPointID,imgName)
global maskFolder

coralNumParent = allMasks{coralInCoralParentInd,3};
% Update parent mask
parentMask = allMasks{coralInCoralParentInd,1};
stats = regionprops(parentMask,'Centroid');
centroid = stats(1).Centroid;
XCenter = centroid(1); YCenter = centroid(2);
parentArea = sum(parentMask(:));

% Update the parent
parentSampleID = NMP_getParentSampleID(coralNumParent,sampleDirPointID);
updateSamplesTable2(coralNumParent,parentArea,XCenter,YCenter,parentSampleID{1});
maskMatPath = fullfile(maskFolder,[imgName(1:end-4),'_coralNum_',num2str(coralNumParent),'_sampleNum_',num2str(parentSampleID{1}),'_data.mat']);

load(maskMatPath)
userData.Area = parentArea;
save(maskMatPath,'userData','coralMask')
