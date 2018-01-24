% function to click around, if click falls on a coral, active it (make
% contours blue), load properties, show properties in window. properties
% window is not editable at this point.
function NMP_displayReadOnlyProperties_mainFig(figData)


try
    
    % Has the load button been clicked?
    hLoad1 = findall(0,'tag','NMP_loadButton');
    if hLoad1.UserData == 1
        
        hLoad = findall(0,'tag','NMP_compLoadButton');
        
        % Are we in edit mode?
        hEdit = findall(0,'tag','NMP_editButton');
        
        % Don't execute anything before an image has been loaded
        if hLoad.UserData == 1
            % Which point the the user click?
            pointClicked = figData.NMP_clickedPoint;
            % Is there a coral where the user clicked?
            allMasks = figData.NMP_allMasks;
            activeCoralInd = NMP_isPointValid(allMasks,pointClicked);
            % If the user indeed clicked on a coral
            if ~isempty(activeCoralInd)
                currentYearImage = figData.NMP_img; % Current year
                currentYearImageName = figData.NMP_imgName; % image name
                labelMapCurrentYear = figData.NMP_labelMapCurrentYear; % label map
                allMasks{activeCoralInd,2} = [0 0 1]; % make active color blue

                userData = allMasks{activeCoralInd,5};
                
                %userData = NMP_pullPropertiesFromDB(coralNum);
                %[existingMasksCurrentYear,existingMasksInside] = NMP_drawOverallMask(allMasks);
                %existingMasksCurrentYear = NMP_drawOverallMask(allMasks); % updated masks, mostly making contour blue
                % Update the active image in the window which was clicked.
                %NMP_displayUpdatedImage2(currentYearImage,labelMapCurrentYear,existingMasksCurrentYear,existingMasksInside,currentYearImageName,guihandles(NMP_mainWindow))
                % Show the properties of the selected, valid coral
                NMP_populateProperties(userData)
                % Are we in read-only mode?
                if ~hEdit.Value;
                    NMP_makePropertiesWindowReadOnly()
                end
                % Clear the clicked point
                figData.NMP_clickedPoint = [];
                figData.NMP_activeCoralInd = activeCoralInd;
                % Send everything back to the main GUI - this is where we'll
                % look for it for saving
                guidata(NMP_mainWindow,figData);
              
            else % The user did not click on a coral, just in empty space
                return
            end
        else % an image has not been loaded yet, so do nothing
            return
        end
        
        
    end
catch err
    return
end
