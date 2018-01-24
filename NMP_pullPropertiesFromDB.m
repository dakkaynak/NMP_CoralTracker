function coralData = NMP_pullPropertiesFromDB(coralID)

global conn

coralData = fetch(conn,'SELECT * FROM Samples WHERE CoralID = ',num2str(coralID));