function NMP_diveSiteCallback(hObject, eventdata,~)

handles = guihandles(eval(get(gcf,'Name')));
hObject.UserData = 1;
% User chose this site
chosenSiteInd = hObject.Value;
% Enable the 'year' dropdown
handles.NMP_yearDropdown.Enable = 'on';
% Populate valid years for that image
validYears = NMP_getValidYears(chosenSiteInd);

handles.NMP_yearDropdown.String = validYears;
handles.NMP_yearDropdown.Value = 1;
uiresume(gcbf);
