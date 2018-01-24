function nextNum = NMP_getNextNumber()

global conn

% This is the last entry in the database table Samples
maxID = fetch(conn,'SELECT max(ID) FROM Samples');
% Thus is the new number we're giving the new coral
nextNum = maxID + 1;
