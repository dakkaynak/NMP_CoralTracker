function data = NMP_pullPropertiesFromGUI()

% Collect the necessary pieces of information
coralStatus = findobj(0,'tag','NMP_coralStatus');
data.Status = coralStatus.Value;

coralID = findobj(0,'tag','NMP_coralIDEdit');
data.CoralID = coralID.String;

locationID = findobj(0,'tag','NMP_locationIDEdit');
data.LocationID = locationID.Value;

coralType = findobj(0,'tag','NMP_coralType');
data.Type = coralType.Value;

coralGenus = findobj(0,'tag','NMP_coralGenus');
data.Genus = coralGenus.Value;

coralSpecies = findobj(0,'tag','NMP_coralSpecies');
data.Species = coralSpecies.Value;

percentCoverage = findobj(0,'tag','NMP_coralCoverage');
data.Coverage = percentCoverage.Value;

area = findobj(0,'tag','NMP_areaEdit');
data.Area = area.String;

percentBleached = findobj(0,'tag','NMP_coralPercentBleached');
data.PercentBleached = percentBleached.String;

remark = findobj(0,'tag','NMP_coralRemark');
data.Remark = remark.String;

isPartial = findobj(0,'tag','NMP_isPartial');
data.isPartial = isPartial.Value;