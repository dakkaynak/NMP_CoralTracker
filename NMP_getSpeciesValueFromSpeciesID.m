function speciesValue = NMP_getSpeciesValueFromSpeciesID(speciesID)

global conn Species
speciesName = fetch(conn,['SELECT Name FROM Species WHERE ID = ',num2str(speciesID{1})]);
speciesValue = find(ismember(Species,speciesName));