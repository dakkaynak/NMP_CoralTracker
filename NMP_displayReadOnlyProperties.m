% function to click around, if click falls on a coral, active it (make
% contours blue), load properties, show properties in window. properties
% window is not editable at this point.
function NMP_displayReadOnlyProperties(figData)

try
    activeFig = get(gcf);
    handles = guihandles(activeFig.CurrentAxes);
    
    % Have the images been loaded?
    hLoad1 = findall(0,'tag','NMP_loadButton');
    hLoad = findall(0,'tag','NMP_compLoadButton');
    % Are we in edit mode?
    hEdit = findall(0,'tag','NMP_editButton');
    % We should not be editing
    hFixBoundary = findall(0,'tag','NMP_fixBoundaryButton');
    hFixBoundaryR = findall(0,'tag','NMP_reshapeBoundaryButton');
    hDrawP = findall(0,'tag','NMP_drawButton');
    hDrawF = findall(0,'tag','NMP_drawButtonFreehand');
    allMasks = figData.NMP_allMasks;
    if isfield(figData,'NMP_tempMasks')
        tempMasks = figData.NMP_tempMasks;
    else
        tempMasks = allMasks;
    end
    if isfield(figData,'NMP_activeCoralInd')
        lastSelectedCoralInd = figData.NMP_activeCoralInd;
    else
        lastSelectedCoralInd = NaN;
    end
    currentYearImage = figData.NMP_img; % Current year
    currentYearImageName = figData.NMP_imgName; % image name
    labelMapCurrentYear = figData.NMP_labelMapCurrentYear; % label map
    modifiers = get(gcf,'CurrentModifier');
    wasShiftPressed = ismember('shift',   modifiers);  % true/false
    pause(0.5)
    if isfield(figData,'NMP_selectedToMerge')
        selectedCorals = figData.NMP_selectedToMerge;
    else
        selectedCorals = [];
    end
    
    
    % Has the load button been clicked?
    if hLoad1.UserData == 1
        % Don't execute anything before an image has been loaded
        if hLoad.UserData == 1
            if ~(hFixBoundary.Value | hFixBoundaryR.Value | hDrawP.Value | hDrawF.Value)
                % Which point the the user click?
                pointClicked = figData.NMP_clickedPoint;
                % Is there a coral where the user clicked?
                activeCoralInd = NMP_isPointValid(allMasks,pointClicked);
                % If the user indeed clicked on a coral
                if ~isempty(activeCoralInd)
                    
                    if ~wasShiftPressed % single selection
                        
                        oldColor = allMasks{activeCoralInd,2};
                        userData = allMasks{activeCoralInd,5};
                        if activeCoralInd~=lastSelectedCoralInd
                            figData = NMP_selectCoral(allMasks,activeCoralInd,handles,figData,currentYearImage,labelMapCurrentYear,currentYearImageName,activeFig,userData);
                            
                            if ~hEdit.Value;
                                NMP_makePropertiesWindowReadOnly()
                            end
                        else % unselect the coral
                            
                            figData = NMP_unselectCoral(allMasks,activeCoralInd,oldColor,currentYearImage,labelMapCurrentYear,currentYearImageName,activeFig,figData);
                        end
                        guidata(activeFig.CurrentAxes,figData);
                    elseif wasShiftPressed

                        if hEdit.Value
                            oldColors{activeCoralInd,2} = allMasks{activeCoralInd,2};
                            userData = allMasks{activeCoralInd,5};
                            if isempty(selectedCorals)
                                
                                tempMasks{activeCoralInd,2} = [0 0 1];
                                figData = NMP_selectCoral(tempMasks,activeCoralInd,handles,figData,currentYearImage,labelMapCurrentYear,currentYearImageName,activeFig,userData);
                                selectedCorals = unique([selectedCorals activeCoralInd]);
                            elseif ~isempty(selectedCorals)
                                if  ~ismember(selectedCorals,activeCoralInd)
                                    selectedCorals = unique([selectedCorals activeCoralInd]);
                                    for j = 1:numel(selectedCorals)
                                        tempMasks{selectedCorals(j),2} = [0 0 1];
                                    end
                                    figData = NMP_selectCoral(tempMasks,activeCoralInd,handles,figData,currentYearImage,labelMapCurrentYear,currentYearImageName,activeFig,userData);
                                    
                                    
                                else % unselect the coral
                                    tempMasks{activeCoralInd,2} = oldColors{activeCoralInd,2};
                                    selectedCorals = selectedCorals(selectedCorals~=activeCoralInd);
                                    for j = 1:numel(selectedCorals)
                                        tempMasks{selectedCorals(j),2} = [0 0 1];
                                    end
                                    
                                    figData = NMP_unselectCoral(tempMasks,activeCoralInd,oldColors{activeCoralInd,2},currentYearImage,labelMapCurrentYear,currentYearImageName,activeFig,figData);
                                    
                                end
                            end
                            
                            figData.NMP_selectedToMerge = selectedCorals;
                            figData.NMP_tempMasks = tempMasks;
                            guidata(activeFig.CurrentAxes,figData);
                        end
                    end
                    
                end
            else % The user did not click on a coral, just in empty space
                return
            end
        else % an image has not been loaded yet, so do nothing
            return
        end
        uiresume(gcbf);
    end
catch err
    return
end
