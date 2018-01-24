function NMP_typeCallback(hObject,eventdata,handles)

global conn

selectedType = hObject.Value;
typeString = hObject.String;
selectedTypeText = typeString(selectedType);
typeID = fetch(conn,['SELECT ID FROM Types WHERE NAME = ','''',selectedTypeText{1},'''']);
% valid genuses
validGenuses = fetch(conn,['SELECT * FROM Genuses WHERE TypeID = ',num2str(typeID{1})]);

% valid genusID
if ~isempty(validGenuses)
    validGenusID = validGenuses(:,1);
    validGenusArray = strrep(num2str(cell2mat(validGenusID)'),'  ',',');
    validGenusArray = strrep(validGenusArray,',,',',');
    
    % Text of valid genuses
    handles.NMP_coralGenus.String = validGenuses(:,2);
    
    % valid species
    validSpecies = fetch(conn,['SELECT * FROM Species WHERE GenusID IN (',validGenusArray,')']);
    allSpecies = fetch(conn,['SELECT * FROM Species WHERE GenusID IN (',validGenusArray,')']);

    if ~isempty(validSpecies)
        handles.NMP_coralSpecies.String = validSpecies(:,3);
    else
        handles.NMP_coralSpecies.String = 'None';
    end
else
    handles.NMP_coralGenus.String = 'None';
    handles.NMP_coralSpecies.String = 'None';
end
