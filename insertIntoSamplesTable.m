function insertIntoSamplesTable(insertdata)

global conn
% Insert into samples table
colNamesSamples = {'ID','CoralID','SamplePointDirID','Area','BleachedRate','ConditionID','XCenter','YCenter','MaskMatPath','isPartial','Comment'};
%insertdata = {newID,coralNum,samplePointDirID,area,bleachedRate,conditionID,XCenter,YCenter,maskMatPath,isPartial,comments};
insertdata = cell2table(insertdata,'VariableNames',colNamesSamples);
insert(conn,'Samples',colNamesSamples,insertdata);