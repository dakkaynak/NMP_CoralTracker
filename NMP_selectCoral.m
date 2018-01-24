function figData = NMP_selectCoral(allMasks,activeCoralInd,handles,figData,currentYearImage,labelMapCurrentYear,currentYearImageName,activeFig,userData)

% make active color blue
allMasks{activeCoralInd,2} = [0 0 1];
handles.activeCoralInd = activeCoralInd;
figData.NMP_activeCoralInd = activeCoralInd;

NMP_makeCoralActive(allMasks,currentYearImage,labelMapCurrentYear,currentYearImageName,activeFig);
% Show the properties of the selected, valid coral
NMP_populateProperties(userData)