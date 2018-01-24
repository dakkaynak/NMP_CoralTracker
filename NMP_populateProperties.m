
function NMP_populateProperties(data)

handles = guihandles(NMP_propertiesWindow);
handles.NMP_coralStatus.Value = 2;% If we are populating the properties from a that is already marked coral, its status should be "old".
handles.NMP_coralIDEdit.String = data.CoralID ;
handles.NMP_locationIDEdit.String = data.LocationID;
handles.NMP_coralType.Value = data.Type;
handles.NMP_coralGenus.Value = data.Genus;
handles.NMP_coralSpecies.Value = data.Species;
handles.NMP_coralCoverage.Value = data.Coverage;
handles.NMP_areaEdit.String = data.Area;
handles.NMP_coralPercentBleached.Value = data.PercentBleached;
handles.NMP_coralRemark.String = data.Remark;
handles.NMP_isPartial.Value = data.isPartial;
