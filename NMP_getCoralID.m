function coralID = NMP_getCoralID(speciesID,pointID,DirectionID)

global conn

coralData = fetch(conn,'SELECT ID FROM Corals WHERE SpeciesID = ',num2str(speciesID),' AND PointID = ',num2str(pointID),' AND DirectionID = ',num2str(DirectionID));

if isempty(coralData{1}) % no entry for this coral
    maxID = fetch(conn,'SELECT ID FROM Corals WHERE ID = (SELECT max(ID) FROM Corals)');
    if isempty(maxID)
        coralID = 1;
    else
        coralID = maxID{1} + 1;
    end
else % there was an ID
    coralID = coralData{1};
end

