function NMP_makeCoralActive(allMasks,currentYearImage,labelMapCurrentYear,currentYearImageName,activeFig)

[existingMasksCurrentYear,existingMasksInside] = NMP_drawOverallMask(allMasks);
% Update the active image in the window which was clicked.
NMP_displayUpdatedImage2(currentYearImage,labelMapCurrentYear,existingMasksCurrentYear,existingMasksInside,currentYearImageName,guihandles(activeFig.CurrentAxes))

