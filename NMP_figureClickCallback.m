function NMP_figureClickCallback(hObject,eventdata,handles)

% Have the images been loaded?
hLoad1 = findall(0,'tag','NMP_loadButton');
hLoad = findall(0,'tag','NMP_compLoadButton');

% We should not be editing
hFixBoundary = findall(0,'tag','NMP_fixBoundaryButton');
hFixBoundaryR = findall(0,'tag','NMP_reshapeBoundaryButton');
hDrawP = findall(0,'tag','NMP_drawButton');
hDrawF = findall(0,'tag','NMP_drawButtonFreehand');
try
    % Has the load button been clicked?
    if hLoad1.UserData == 1
        % Don't execute anything before an image has been loaded
        if hLoad.UserData == 1
            if ~(hFixBoundary.Value | hFixBoundaryR.Value | hDrawP.Value | hDrawF.Value)
                m = get(hObject,'CurrentAxes');
                XY = round(get(m,'CurrentPoint'));
                XY = XY(1,1:2);
                figData = guidata(hObject);
                figData.NMP_clickedPoint = XY;
                guidata(hObject,figData)
                NMP_displayReadOnlyProperties(figData)
            end
        end
    end
catch err
end

