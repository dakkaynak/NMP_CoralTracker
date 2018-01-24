function NMP_writeToDatabase(table,fields,data)
global conn

% fields should be a cell array
% {field1,field2,field3}

% data is the struct that is passed from the user

%conn = sqlite('DeryaSandbox.db','connect');
insert(conn,table,fields,data');
close(conn);
