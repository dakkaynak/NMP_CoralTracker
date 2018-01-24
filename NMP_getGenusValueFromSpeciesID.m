function genusValue = NMP_getGenusValueFromSpeciesID(speciesID)

global conn Genus
genusID = fetch(conn,['SELECT GenusID FROM Species WHERE ID = ',num2str(speciesID{1})]);
genusName = fetch(conn,['SELECT Name FROM Genuses WHERE ID = ',num2str(genusID{1})]);
genusValue = find(ismember(Genus,genusName));
