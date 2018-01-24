% test for pulling data from the database
clear;close;clc

% set up connection
javaaddpath('/Users/deryaakkaynak/Dropbox/NMP Coral Tracker Software from Derya/sqljdbc_6.0/enu/jre7/sqljdbc41.jar');
conn = database('', 'nmp', 'Sy3iquku39_!', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', 'mssql3.gear.host', 'AuthType', 'Server');

select_Conditions = 'SELECT * FROM Conditions';

conditions = fetch(conn,select_Conditions);

%% see if we can get maxID from database

% set up connection
javaaddpath('/Users/deryaakkaynak/Dropbox/NMP Coral Tracker Software from Derya/sqljdbc_6.0/enu/jre7/sqljdbc41.jar');
conn = database('', 'nmp', 'Sy3iquku39_!', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', 'mssql3.gear.host', 'AuthType', 'Server');

selectString1 = 'SELECT * FROM Samples ORDER BY id';

selectString2 = 'SELECT ID FROM Samples WHERE ID=(SELECT max(ID) FROM Samples)';
selectString3 = 'SELECT max(ID) FROM Samples';

maxID = fetch(conn,selectString3);