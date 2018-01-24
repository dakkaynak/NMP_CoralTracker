function figData = NMP_unselectCoral(allMasks,activeCoralInd,oldColor,currentYearImage,labelMapCurrentYear,currentYearImageName,activeFig,figData)

allMasks{activeCoralInd,2} = oldColor; % make active color blue
NMP_makeCoralActive(allMasks,currentYearImage,labelMapCurrentYear,currentYearImageName,activeFig);
figData.NMP_activeCoralInd = NaN;