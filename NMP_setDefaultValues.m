function NMP_setDefaultValues(handles)

% Does not clear read only fields: coralID, locationID, area;
handles.NMP_coralStatus.Value = 1;
handles.NMP_coralType.Value = 1;
handles.NMP_coralSpecies.Value = 18;
handles.NMP_coralGenus.Value = 1;
handles.NMP_coralCoverage.Value = 1;
handles.NMP_coralPercentBleached.String = '0';
handles.NMP_coralRemark.String = '';
handles.NMP_isPartial.Value = 2;
