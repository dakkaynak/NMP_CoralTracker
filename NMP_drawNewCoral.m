function NMP_drawNewCoral(hObject, eventdata,handles)

% which button was pressed?
polygon = findobj(0,'tag','NMP_drawButton');
polygonFlag = polygon.Value;
freehand = findobj(0,'tag','NMP_drawButtonFreehand');
freehandFlag = freehand.Value;

% User has toggled this button to be able to draw a new coral
if polygonFlag | freehandFlag
    
    % Get the data for this figure
    figData = guidata(NMP_mainWindow);
    allMasks = figData.NMP_allMasks;
    coralInd = size(allMasks,1) + 1;
    existingMasksCurrentYear = figData.NMP_existingMasksCurrentYear;
    insideMasks = figData.NMP_insideMasks;
    labelMapCurrentYear = figData.NMP_labelMapCurrentYear;
    currentYearImage = figData.NMP_img;
    imgName = figData.NMP_imgName;
    
    % Start the drawing
    hAx = get(NMP_mainWindow,'currentAxes');
    h_im = figData.NMP_him;
    % How does the user want to draw? A polygon, or freehand?
    if polygonFlag
        keepMask = NMP_drawShape(hAx,h_im);
    elseif freehandFlag
        [keepMask,~] = NMP_drawShape2(hAx,h_im);
    end

    % If the user just drew this coral, the boundary will be blue, meaning it's active.
    [keepMaskColor,~] = NMP_colorContours(keepMask,[0 0 1],[0 0 0]);
    overallMaskColor = existingMasksCurrentYear + keepMaskColor;
    
    % Display the updated mask
    him = NMP_displayUpdatedImage2(currentYearImage,labelMapCurrentYear,overallMaskColor,insideMasks,imgName,handles);
    
    % Send the data to the gui
    figData.NMP_userMask = keepMask;
    handles.NMP_saveButton.Enable = 'on';
    handles.NMP_activeCoralInd.String = coralInd; % this is an invisible field in the main gui
    figData.NMP_activeCoralInd.String = coralInd;
    allMasks{coralInd,1} = keepMask;
    allMasks{coralInd,7} = 0;
    % Is this a "coral in a coral" case?
    allMasks = NMP_coralInCoral(allMasks,coralInd);
    figData.NMP_allMasks = allMasks;
    figData.NMP_him = him; % handle of the image
    % Untoggle the button
    hObject.Value = 0;
    guidata(NMP_mainWindow,figData)
    
    % Now update the properties window
    handles2 = guihandles(NMP_propertiesWindow);
    % Update the area of the coral
    handles2.NMP_areaEdit.String = sum(keepMask(:));
    
else
    return;
end

uiresume(gcbf);
end
