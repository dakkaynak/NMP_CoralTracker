function [overallMask,overallLabelMap,allCoralMasks,overallInsideMasks] = NMP_loadAllMasksPerImage(imageName)

global maskFolder conn Status

% Get a list of all the masks that were previously made for this image
allMasks = dir([maskFolder,'/*.mat']);
allFileNames = {allMasks.name}';
% Is this a new image? We check if there are existing masks
[~,inds] = NMP_isThisAnewImage(imageName);

% Load the first mask for this image so we get the size
load(fullfile(maskFolder,allFileNames{inds(1)}));

% Prepare placeholders for the GUI
s = size(coralMask);
overallMask = zeros(s(1),s(2),3);
overallLabelMap = zeros(s(1),s(2),3);
allCoralMasks = cell(numel(inds),2);
overallInsideMasks = zeros(s(1),s(2),3);

% Colors of contours
yellow = [1 1 0]; % previously saved coral
red = [1 0 0]; % no properties were saved.
%blue = [0 0 1]; % active/selected coral

% Cycle through all existing masks in this image
for i = 1:numel(inds)
    thisName = allFileNames{inds(i)};
    
    % load masks from the local folder
    load(fullfile(maskFolder,allFileNames{inds(i)}));

    % load userData from the database, we need the coralNum
    dashLoc1 = strfind(thisName,'_coralNum_');
    dashLoc2 = strfind(thisName,'_sampleNum_');
    endLoc = strfind(thisName,'_data.mat');
    coralNum = str2double(thisName(dashLoc1+10:dashLoc2-1)); % this is coralID in the database
    sampleNum = str2double(thisName(dashLoc2+11:endLoc-1)); % this is sampleID in the database
    %maskMatPath = fullfile(maskFolder,[imgName(1:end-4),'_coralNum_',num2str(coralNum),'_sampleNum_',num2str(sampleID),'_data.mat']);

   
    %  All the coral properties from the DB
    coralData = fetch(conn,['SELECT * FROM Samples WHERE CoralID = ',num2str(coralNum)]);
    % in this order: ID, coralID, samplePointDirID, Area, BleachedRate,
    % ConditionID,XCenter, Ycenter, MaskPath,isPartial, Comment
    
    % userdata contains the properties/indices in the GUI.
    userData.Area = coralData{4};
    userData.PercentBleached = coralData{5};
    userData.isPartial = coralData{10};
    userData.Remark = coralData{11};
    userData.Coverage = 0;%coralData{5};
    conditionID = coralData{6};
    
    userData.Status = conditionID; % Can be old, bleached, dead, or other. Once a "new" coral is saved to the DB, it is one of these.
    userData.LocationID = coralData{3};
    userData.CoralID = coralNum;
    % Other info
    speciesID = fetch(conn,['SELECT SpeciesID FROM Corals WHERE ID = ',num2str(coralNum)]);
    genusID = fetch(conn,['SELECT GenusID FROM Species WHERE ID = ',num2str(speciesID{1})]);
    thisGenusText = fetch(conn,['SELECT Name FROM Genuses WHERE ID = ',num2str(genusID{1})]);
    userData.Type = NMP_getTypeValueFromGenusID(genusID);
    userData.Genus = NMP_getGenusValueFromSpeciesID(speciesID);
    userData.Species = NMP_getSpeciesValueFromSpeciesID(speciesID);
    genusColor = cell2mat(fetch(conn,['SELECT R,G,B FROM Genuses WHERE ID = ',num2str(genusID{1})]));
    
    % If Genus color isn't returned from the database for some reason
    if isempty(genusColor)
        genusColor = [255 255 255];
    end

    defaultFlag = NMP_checkDefaultValues(userData);
    
    % Decide boundary color
    % When images are loaded, load masks in yellow, except if their
    % properties are all non-existent; then red
    if defaultFlag
        rimColor = red;
    else
        rimColor = yellow;
    end
    
    % Draw the labeled maps
    labelMap = NMP_labelCoralsInImage(coralMask,coralNum,thisGenusText);
    overallLabelMap = overallLabelMap + labelMap;
    % Draw the colored maps
    [coloredMask,coloredInside] = NMP_colorContours(coralMask,rimColor,genusColor);
    overallMask = overallMask + coloredMask;
    overallInsideMasks = overallInsideMasks + coloredInside;
    % Save the properties of the coral into a cell array
    allCoralMasks{i,1} = coralMask;
    allCoralMasks{i,2} = rimColor;
    allCoralMasks{i,3} = coralNum;
    allCoralMasks{i,4} = thisGenusText;
    allCoralMasks{i,5} = userData;
    allCoralMasks{i,6} = genusColor;
    allCoralMasks{i,7} = coralData{1}; % SampleID
    %allCoralMasks{i,8} = ; coral in coral parent ID
end
