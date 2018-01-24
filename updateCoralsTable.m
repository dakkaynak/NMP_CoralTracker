function updateCoralsTable(SpeciesID,coralNum)

global conn

updateQuery = ['UPDATE Corals Set SpeciesID = ',num2str(SpeciesID{1}),' WHERE ID = ',num2str(coralNum)];
exec(conn,updateQuery);