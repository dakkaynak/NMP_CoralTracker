function NMP_drawFigure(y,figData)

% Now that everything is saved, update the Figure
[existingMasksCurrentYear,labelMapCurrentYear,insideMasks,allMasks] = NMP_initializeMasks(y,figData.NMP_imageSize,figData.NMP_imgName);

% Show the image
h = guihandles(eval(figData.NMP_fig)); 
him = NMP_displayUpdatedImage2(figData.NMP_img,labelMapCurrentYear,existingMasksCurrentYear,insideMasks,figData.NMP_imgName,h);

% Pass relevant data to the main workspace
figData = NMP_gatherLoadedImageData(figData.NMP_img,figData.NMP_imgName,y,labelMapCurrentYear,existingMasksCurrentYear,insideMasks,him,...
    allMasks,figData.NMP_site,figData.NMP_point,figData.NMP_direction,figData.NMP_currentYear,figData.NMP_imageSize,figData.NMP_fig);
guidata((eval(figData.NMP_fig)),figData);