function NMP_loadCallback(hObject, eventdata,~)

global Genus Species Types Status

hObject.UserData = 1;

% Load the image selected
handles = guihandles(gcf);
[img,imgName] = NMP_loadImages(handles.NMP_mainFig);
[site,point,direction,year] = NMP_parseImageName2(imgName);

s = size(img);

% Check if this is a brand new image
[y,~] = NMP_isThisAnewImage(imgName);
[existingMasksCurrentYear,labelMapCurrentYear,insideMasks,allMasks] = NMP_initializeMasks(y,s,imgName);

% Show the image
him = NMP_displayUpdatedImage2(img,labelMapCurrentYear,existingMasksCurrentYear,insideMasks,imgName,handles);

% Pass relevant data to the main workspace
figData = NMP_gatherLoadedImageData(img,imgName,y,labelMapCurrentYear,existingMasksCurrentYear,insideMasks,him,...
   allMasks,site,point,direction,year,s,handles);
figData.NMP_fig = 'NMP_mainWindow';
samplePointDirID = figData.NMP_samplePointDirID;
guidata(handles.NMP_mainFig,figData);

% Be sure to set the site of the reference window to the same site of the
% main window
handles2 = guihandles(NMP_comparisonWindow);
% Here show the background image on the comparison window
I = imread('icons/logo.jpg');
imshow(I)

diveSites = handles.NMP_diveSiteDropdown.String;
chosenSite = diveSites(handles.NMP_diveSiteDropdown.Value);
handles2.NMP_comparisonSiteName.String = chosenSite;
handles2.NMP_yearDropdown.String = handles.NMP_yearDropdown.String;
figData = guidata(NMP_comparisonWindow);
figData.NMP_fig = 'NMP_comparisonWindow';
guidata(NMP_comparisonWindow,figData);

% open the properties window
handles3 = guihandles(NMP_propertiesWindow);
% populate the properties window dropdowns
% Data from the database to be loaded once when the program loads up
% data = NMP_readListsFromDatabase;
handles3.NMP_coralStatus.String = Status;
handles3.NMP_coralType.String = Types;
handles3.NMP_coralGenus.String = Genus;
handles3.NMP_coralSpecies.String = Species;
% handles3.NMP_coralCoverage.String = data.coverage;
% Populate the properties window with "location ID"
handles3.NMP_locationIDEdit.String = samplePointDirID;

% Send the data to the figure
guidata(NMP_propertiesWindow,handles3)

% Continue
uiresume(gcbf);
end



% % if there are unsaved changes, ask the user to save
% if existingData.NMP_changesToSave
%     hDel = questdlg('Discard changes?');
%     switch hDel
%         case 'Yes'
%             uiresume(gcbf);
%         case 'No'
%             NMP_saveAllMasksPerImage()
%         case 'Cancel'
%             handles.NMP_diveSiteDropdown.String = curDiveSiteString;
%             handles.NMP_diveSiteDropdown.Value = curDiveSiteValue;
%             handles.NMP_yearDropdown.String = curYearString;
%             handles.NMP_yearDropdown.Value = curYearValue;
%             return;
%     end
% end


