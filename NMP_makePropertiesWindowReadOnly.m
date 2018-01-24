function NMP_makePropertiesWindowReadOnly()

% Disable everything in the properties window
handles = guihandles(NMP_propertiesWindow);
handles.NMP_coralPropertiesResetButton.Enable = 'off';
handles.NMP_coralPropertiesSaveButton.Enable = 'off';
handles.NMP_coralStatus.Enable = 'off';
handles.NMP_coralID.Enable = 'off';
handles.NMP_coralLocationID.Enable = 'off';
handles.NMP_coralType.Enable = 'off';
handles.NMP_coralGenus.Enable = 'off';
handles.NMP_coralSpecies.Enable = 'off';
handles.NMP_coralPercentCoverage.Enable = 'off';
handles.NMP_coralArea.Enable = 'off';
handles.NMP_coralPercentBleached.Enable = 'off';
handles.NMP_coralRemark.Enable = 'off';
handles.NMP_isPartial = 'off';
