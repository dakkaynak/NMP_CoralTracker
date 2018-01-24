function [img,imgName] = NMP_loadImages(fig)
global imageFolder
handles = guihandles(fig);
diveSites = handles.NMP_diveSiteDropdown.String;
diveSiteSelected = diveSites(handles.NMP_diveSiteDropdown.Value);
[site,point,direction] = NMP_parseImageName(diveSiteSelected{1});
years = handles.NMP_yearDropdown.String;
currentYearSelected = years{handles.NMP_yearDropdown.Value};
currentYearSelected(1:2) = [];

imgName = [site,' ',point,' ',direction,' ',num2str(currentYearSelected),'.JPG'];
img = NMP_readImage(imageFolder,fullfile(site,imgName));



