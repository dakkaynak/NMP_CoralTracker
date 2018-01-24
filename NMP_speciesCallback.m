function NMP_speciesCallback(hObject,eventdata,handles)

global conn

% What the user selected
selectedSpecies = hObject.Value;
speciesString = hObject.String;
selectedSpeciesText = speciesString(selectedSpecies);

genusID = fetch(conn,['SELECT GenusID FROM Species WHERE NAME = ','''',selectedSpeciesText{1},'''']);

% Set genus
genusList = handles.NMP_coralGenus.String;
genusName = fetch(conn,['SELECT Name FROM Genuses WHERE ID = ',num2str(genusID{1})]);
genusValue = find(ismember(genusList,genusName));
handles.NMP_coralGenus.Value = genusValue;

% Set type
typeList = handles.NMP_coralType.String;
typeID = fetch(conn,['SELECT TypeID FROM Genuses WHERE ID = ',num2str(genusID{1})]);
typeName = fetch(conn,['SELECT Name FROM Types WHERE ID = ',num2str(typeID{1})]);
typeValue = find(ismember(typeList,typeName));
handles.NMP_coralType.Value = typeValue;

