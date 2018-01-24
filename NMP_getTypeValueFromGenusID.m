function typeValue = NMP_getTypeValueFromGenusID(genusID)

global conn Types
typeID = fetch(conn,['SELECT TypeID FROM Genuses WHERE ID = ',num2str(genusID{1})]);
typeName = fetch(conn,['SELECT Name FROM Types WHERE ID = ',num2str(typeID{1})]);
typeValue = find(ismember(Types,typeName));