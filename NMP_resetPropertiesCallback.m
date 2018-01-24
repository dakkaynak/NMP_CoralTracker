function NMP_resetPropertiesCallback(hObject, eventdata,handles)
hObject.UserData = 1;
NMP_setDefaultValues(handles)
uiresume(gcbf);
end