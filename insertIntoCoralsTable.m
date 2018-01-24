function insertIntoCoralsTable(insertdata)

global conn

% Insert into corals table
colNamesCoral = {'ID','SpeciesID','PointID','DirectionID'};
%insertdata = {coralNum,SpeciesID{1},PointID,DirectionID};
insertdata = cell2table(insertdata,'VariableNames',colNamesCoral);
insert(conn,'Corals',colNamesCoral,insertdata);