function NMP_editCoralCallback(hObject, eventdata,handles)

% User toggled the edit button
if hObject.Value
    % Get the data from the window
    figData = guidata(NMP_mainWindow);
    % collect some information
    allMasks = figData.NMP_allMasks;
    currentYearImageName = figData.NMP_imgName;
    currentYearImage = figData.NMP_img;
    pointClicked = figData.NMP_clickedPoint;
    % Is there a coral where the user clicked?
    activeCoralInd = NMP_isPointValid(allMasks,pointClicked);
    
    if ~isempty(activeCoralInd)
        % Update the handles with the coral clicked
        figData.NMP_activeCoralInd.String = activeCoralInd;
        handles.NMP_activeCoralInd.String = activeCoralInd;
        oldMask = allMasks{activeCoralInd,1};
        
        % is this a coral that already exists in the database, or a new
        % mask user just scribbled, and now wants to update?
        coralNum = allMasks{activeCoralInd,3};
        if coralNum > 0
            y = 0; % existing coral
        else
            y = 1;
        end
        
        him = imhandles(get(gcf,'currentAxes'));%figData.NMP_him;
        % User draws this updated mask
        keepMask = NMP_editBoundaries(him,oldMask);
        allMasks{activeCoralInd,1} = keepMask;
        figData.NMP_allMasks = allMasks;
        figData.NMP_him = him; % handle of the image
        figData.NMP_userMask = keepMask;
        guidata(NMP_mainWindow,figData);
        
        % Now update the properties window
        handles2 = guihandles(NMP_propertiesWindow);
        % Update the area of the coral
        handles2.NMP_areaEdit.String = sum(keepMask(:));
        % Save changes to the database
        NMP_saveCoralData()
        %
        %
        %         % If the user just drew this coral, the boundary will be blue, meaning it's active.
        
        [existingMasksCurrentYear,labelMapCurrentYear,insideMasks,allMasks] = NMP_initializeMasks(y,figData.NMP_imageSize,currentYearImageName);
       
        him = NMP_displayUpdatedImage2(currentYearImage,labelMapCurrentYear,existingMasksCurrentYear,insideMasks,currentYearImageName,guihandles(NMP_mainWindow));
        
        % Untoggle the button
        hObject.Value = 0;
        % Continue
        uiresume(gcbf);
    end
else
    return
end
end
