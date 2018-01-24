function NMP_saveCallback(hObject,eventdata,handles)

% Save the active coral;
NMP_saveCoralData()

% Check if it was a coral in coral scenario and update the parent
figData = guidata(NMP_mainWindow);
activeCoralInd = figData.NMP_activeCoralInd;
allMasks = figData.NMP_allMasks;
if ~isempty(allMasks{activeCoralInd,8})
    coralInCoralParentInd = allMasks{activeCoralInd,8};
    figData.activeCoralInd = coralInCoralParentInd;
    NMP_saveCoralData()
end

