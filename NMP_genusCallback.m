function NMP_genusCallback(hObject,eventdata,handles)

global conn Species

% WHat did the user select?
selectedGenus = hObject.Value;
genusString = hObject.String;
selectedGenusText = genusString(selectedGenus);
genusID = fetch(conn,['SELECT ID FROM Genuses WHERE Name = ','''',selectedGenusText{1},'''']);

% Set type
typeValue = NMP_getTypeValueFromGenusID(genusID);
handles.NMP_coralType.Value = typeValue;

% Narrow species
validSpecies = fetch(conn,['SELECT * FROM Species WHERE GenusID = ',num2str(genusID{1})]);
if ~isempty(validSpecies)
    handles.NMP_coralSpecies.String = validSpecies(:,3);
else
    handles.NMP_coralSpecies.String = Species;
    handles.NMP_coralSpecies.Value = 18;
end
