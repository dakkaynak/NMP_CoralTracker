% Setup and test sandbox database

clear;close;clc

conn = sqlite('DeryaSandbox2.db','create');
setdbprefs('NullNumberRead','0');

% queries to create tables
create_Samples = 'CREATE TABLE Samples(ID int, CoralID int, SamplePointDirID int, Area int, BleachedRate int, ConditionID int,XCenter int, YCenter int, MaskMatPath varchar(255),isPartial int,comment varchar(255))';
create_Condition = 'CREATE TABLE Conditions(ID int,Name varchar(255))';
create_Corals = 'CREATE TABLE Corals(ID int,SpeciesID int,PointID int,DirectionID int)';
create_Species = 'CREATE TABLE Species(ID int,genusID int,Name varchar(45))';
create_Genus = 'CREATE TABLE Genuses(ID int,Name varchar(45),TypeID int,R int,G int, B int)';
create_Type = 'CREATE TABLE Types(ID int,Name varchar(45),isStony int)';
create_Sites = 'CREATE TABLE Sites(ID int,Name varchar(45))';
create_Points = 'CREATE TABLE Points(ID int, Name varchar(255), siteID int)';
create_Directions = 'CREATE TABLE Directions(ID int, Name varchar(255))';
create_SamplesPointsDir = 'CREATE TABLE SamplesPointsDirs(ID int,PointID int,DirectionID int,ImagePath varchar(255),SampleYear int,isConvertedFromOld int,ImageCreatedTime datetime)';

% Create the tables
exec(conn,create_Samples)
exec(conn,create_Condition)
exec(conn,create_Corals);
exec(conn,create_Species);
exec(conn,create_Genus);
exec(conn,create_Type);
exec(conn,create_Sites);
exec(conn,create_Points);
exec(conn,create_Directions);
exec(conn,create_SamplesPointsDir);

% commands to populate the tables

%%%% TYPES %%%%%%%%
insertdata = {1 'Branch' 0; 2 'Non-branch' 0; 3 'Soft' 0; 4 'Millepora' 0; 5 'Other' 0};
colNames = {'ID','Name','isStony'};
insertdata = cell2table(insertdata,'VariableNames',colNames);
insert(conn,'Types',colNames,insertdata);

%%%% GENUS %%%%%%%%%
insertdata = {1	'Null'	239	239	239 5;
6	'Acanthastrea'	101	26	15 3;
7	'Acropora'	78	0	120 1;
8	'Alveopora'	152	10	107 3;
9	'Astreopora'	103	76	18 3;
10	'Balanophyllia'	147	28	8 3;
11	'Blastomussa'	104	8	57 3;
12	'Coscinaraea'	119	46	16 3;
13	'Ctenactis'	21	9	164 3;
14	'Cyphastrea'	165	106	13 3;
15	'Echinophyllia'	13	119	34 3;
16	'Echinopora'	8	9	101 3;
17	'Euphyllia'	9	116	9 3;
18	'Favia'	162	86	29 3;
19	'Favites'	31	39	163 3;
20	'Fungia'	51	14	101 3;
21	'Galaxea'	154	27	113 3;
22	'Goniastrea'	117	137	8 3;
23	'Goniopora'	27	92	162 3;
24	'Gyrosmilia'	13	19	111 3;
25	'Herpolitha'	16	64	101 3;
26	'Hydnophora'	14	162	31 3;
27	'Leptastrea'	12	124	126 3;
28	'Leptoria'	139	9	139 3;
29	'Leptoseris'	10	26	101 3;
30	'Lobophyllia'	152	12	53 4;
31	'Montipora'	31	62	165 3;
32	'Mycedium'	6	75	101 3;
33	'Oxipora'	94	119	22 3;
34	'Pachyseris'	111	24	127 3;
35	'Palythoa'	56	117	21 6;
36	'Pavona'	49	162	27 3;
37	'Platygyra'	68	8	114 3;
38	'Plerogyra'	20	101	11 3;
39	'Plesiastrea'	140	25	46 3;
40	'Pocillopora'	16	114	78 1;
41	'Porites'	38	155	9 3;
42	'Psammocora'	23	157	76 3;
43	'Rhytisma'	70	154	10 4;
44	'Seriatopora'	9	42	101 1;
45	'Siderastrea'	124	8	11 3;
46	'Stylophora'	147	132	25 1;
47	'Turbinaria'	163	33	31 3};

colNames = {'ID','Name','R','G','B','TypeID'};
insertdata = cell2table(insertdata,'VariableNames',colNames);
insert(conn,'Genuses',colNames,insertdata);

%%%% SPECIES %%%%%
insertdata = {1	'humilis'	1;
2	'variabilis'	1;
3	'gemmacea'	14;
4	'fruticulosa'	14;
5	'stelligera'	16;
6	'pentagona'	17;
7	'abdita'	17;
8	'halicora'	17;
9	'retiformis'	20;
10	'pectinata'	20;
11	'microconos'	24;
12	'purpurea'	25;
13	'bottae'	25;
14	'dichotoma'	39;
15	'turbinaria'	47;
16	'theonella'	47;
17	'gray'	47
18 'sp' 1};
colNames = {'ID','Name','GenusID'};
insertdata = cell2table(insertdata,'VariableNames',colNames);
insert(conn,'Species',colNames,insertdata);

%%%% SITES %%%%%%
insertdata = {1 'DEKEL'; 2 'IUI';3 'KATZAA'; 4 'NB'; 5 'NR'; 6 'TABA'};
colNames = {'ID','Name'};
insertdata = cell2table(insertdata,'VariableNames',colNames);
insert(conn,'Sites',colNames,insertdata);

%%%% POINTS %%%%%
insertdata = {1 'A' 1; 2 'B' 1; 3 'C' 1; 4 'D' 1;...
    1 'A' 2; 2 'B' 2; 3 'C' 2; 4 'D' 2;...
    1 'A' 3; 2 'B' 3; 3 'C' 3; 4 'D' 3;...
    1 'A' 4; 2 'B' 4; 3 'C' 4; 4 'D' 4;...
    1 'A' 5; 2 'B' 5; 3 'C' 5; 4 'D' 5;...
    1 'A' 6; 2 'B' 6; 3 'C' 6; 4 'D' 6};
colNames = {'ID','Name','SiteID'};
insertdata = cell2table(insertdata,'VariableNames',colNames);
insert(conn,'Points',colNames,insertdata);

%%%%% DIRECTION %%%%%%%
insertdata = {1 'N';2 'S'; 3 'E'; 4 'W'};
colNames = {'ID','Name'};
insertdata = cell2table(insertdata,'VariableNames',colNames);
insert(conn,'Directions',colNames,insertdata);

%%%% CONDITION %%%%%%%
insertdata = {1 'New'; 2 'Old';3 'Dead'; 4 'Bleached';5 'Unknown'};
colNames = {'ID','Name'};
insertdata = cell2table(insertdata,'VariableNames',colNames);
insert(conn,'Conditions',colNames,insertdata);

close(conn)