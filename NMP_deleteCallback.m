function NMP_deleteCallback(hObject, eventdata,handles)

if hObject.Value
    figData = guidata(NMP_mainWindow);
    currentYearImage = figData.NMP_img;
    currentYearImageName = figData.NMP_imgName;
    
    allMasks = figData.NMP_allMasks;
    % This is the index in the cell array
    pointClicked = figData.NMP_clickedPoint;
    % Is there a coral where the user clicked?
    activeCoralInd = NMP_isPointValid(allMasks,pointClicked);
    if ~isempty(activeCoralInd)
        coralNum = allMasks{activeCoralInd,3};
        
        allMasks{activeCoralInd,2} = [0 0 1];
        sampleID = allMasks{activeCoralInd,7};
        
        [existingMasksCurrentYear,existingMasksInside] = NMP_drawOverallMask(allMasks);
        labelMapCurrentYear = figData.NMP_labelMapCurrentYear; % label map
                    % Update the active image in the window which was clicked.
        NMP_displayUpdatedImage2(currentYearImage,labelMapCurrentYear,existingMasksCurrentYear,existingMasksInside,currentYearImageName,guihandles(NMP_mainWindow))

        pause(1)
        % Confirm
        hDel = questdlg('Are you sure you want to delete this coral mask?');
        
        switch hDel
            case 'Yes'
                allMasks(activeCoralInd,:) = [];
                [existingMasksCurrentYear,existingMasksInside] = NMP_drawOverallMask(allMasks);
                labelMapCurrentYear = NMP_updateLabelMap(allMasks);

                NMP_displayUpdatedImage2(currentYearImage,labelMapCurrentYear,existingMasksCurrentYear,existingMasksInside,currentYearImageName,guihandles(NMP_mainWindow))
                
                NMP_deleteCoralMask(sampleID,currentYearImageName,coralNum)
                figData.NMP_existingMasksCurrentYear = existingMasksCurrentYear;
                figData.NMP_labelMapCurrentYear = labelMapCurrentYear;
                figData.NMP_allMasks = allMasks;
                figData.NMP_activeCoralInd = activeCoralInd;
                handles.NMP_activeCoralInd = activeCoralInd;

                guidata(NMP_mainWindow,figData);
            case 'No'
                return;
            case 'Cancel'
                uiresume(gcbf);
        end
    end
end
hObject.Value = 0;
uiresume(gcbf);
end