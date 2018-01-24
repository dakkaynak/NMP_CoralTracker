function [img,imgName] = NMP_loadImagesCompWindow(fig)
global imageFolder
handles = guihandles(fig);

diveSiteSelected = handles.NMP_comparisonSiteName.String;
[site,point,direction] = NMP_parseImageName(diveSiteSelected{1});
years = handles.NMP_yearDropdown.String;
currentYearSelected = years{handles.NMP_yearDropdown.Value};
year = currentYearSelected;
currentYearSelected(1:2) = [];

imgName = [site,' ',point,' ',direction,' ',num2str(currentYearSelected),'.JPG'];
img = NMP_readImage(imageFolder,fullfile(site,imgName));
s = size(img);

% Check if this is a brand new image
[y,~] = NMP_isThisAnewImage(imgName);
[existingMasksCurrentYear,labelMapCurrentYear,insideMasks,allMasks] = NMP_initializeMasks(y,s,imgName);

% Display the image
him = NMP_displayUpdatedImage2(img,labelMapCurrentYear,existingMasksCurrentYear,insideMasks,imgName,handles);

% Pass relevant data to the main workspace
figData = NMP_gatherLoadedImageData(img,imgName,y,labelMapCurrentYear,existingMasksCurrentYear,insideMasks,him,...
   allMasks,site,point,direction,year,s,handles);
guidata(handles.NMP_comparisonWindow,figData);


