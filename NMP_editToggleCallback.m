function NMP_editToggleCallback(hObject, eventdata,~)

handles = guihandles(NMP_mainWindow);
handles2 = guihandles(NMP_propertiesWindow);
if hObject.Value == 1
    NMP_setMainControlsEnable(handles,'on');
    % These are on the properties window
    NMP_setPropertiesControlsEnable(handles2,'on');
else
    NMP_setMainControlsEnable(handles,'off');
    % These are on the properties window
    NMP_setPropertiesControlsEnable(handles2,'off');
end
uiresume(gcbf);
end

