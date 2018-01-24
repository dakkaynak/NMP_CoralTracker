function data = NMP_readListsFromDatabase

global conn
% select_coralColors = 'SELECT * FROM CoralColors';
% 
% yearsRetrieved = fetch(conn,select_yearsStr);
% insert(conn,table,fields,data');
%close(conn);

%CoralStatus = {'None','New','Old','Bleached','Dead'};
% CoralTypes = {'None','Branch','Non-branch','Soft','Millepora','Other'};
% Genus = {'None','Acropora','Pocillopora','Seriatopora','Stylophora','Acanthastrea','Alveopora','Astreopora',...
%     'Balanophyllia','Blastomussa','Coscinaraea','Ctenactis','Cyphastrea','Echinophyllia','Echinopora',...
%     'Euphyllia','Favia','Favites','Fungia','Galaxea','Goniastrea','Goniopora','Gyrosmilia','Herpolitha',...
%     'Hysdnophora','Leptastrea','Leptoria','Leptoseris','Lobophyllia','Montipora','Mycedium','Oxipora',...
%     'Pachyseris','Pavona','Platygyra','Plerogyra','Plesiastrea','Porites','Psammocora','Siderastrea','Turbinaria',...
%     'Dendronephtya','Lithophyton','Lobophyton','Palythoa','Rhytisma','Sarcophyton','Sinularia','Tubastrea',...
%     'Tubipora','Xenia','Millepora','Algea','Anemone','Coral sp.','Sabellidae','Sponge','Tridacna',...
%     'Tunicate','Shell','branch sp.','non branch sp. ','soft sp.','other sp.'};
% Species = {'None','humilis','variabilis','gemmacea','fruticulosa','stelligera','pentagona','abdita','halicora',...
%     'retiformis','pectinata','microconos','purpurea','bottae','dichotoma','turbinaria','theonella','gray'};

% No idea what coverage is
Coverage = {'None','No'};

% These are reference tables we pull from the database
CoralStatus = fetch(conn,'SELECT Name FROM Conditions');
CoralTypes = fetch(conn,'SELECT Name FROM Types');
Genus = fetch(conn,'SELECT Name FROM Genuses');
Species = fetch(conn,'SELECT Name FROM Species');

% Now we populate this struct which we'll pass to the figure
data.coralStatus = CoralStatus;
data.coralTypes = CoralTypes;
data.genus = Genus;
data.species = Species;
data.coverage = Coverage;
