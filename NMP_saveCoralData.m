function NMP_saveCoralData(hObject,eventdata,~)

global maskFolder conn Species

% The most-up-to-date information regarding the coral is in figData
figData = guidata(NMP_mainWindow);
% image info
imgName = figData.NMP_imgName;
% image masks info
allMasks = figData.NMP_allMasks;
% site info
PointID = figData.NMP_pointID;
DirectionID = figData.NMP_directionID;
samplePointDirID = figData.NMP_samplePointDirID;

% Pull data from the properties window - user just entered/modified these
userData = NMP_pullPropertiesFromGUI();

if isfield(figData,'NMP_activeCoralInd')
    ind = figData.NMP_activeCoralInd.String;
    % Most recent mask of this coral
    coralMask = allMasks{ind,1};
    % Area of the coral
    area = sum(coralMask(:));
    % Is it an existing observation?
    sampleID = allMasks{ind,7};
    % Properties of coral mask
    stats = regionprops(coralMask,'Centroid');
    centroid = stats(1).Centroid;
    XCenter = centroid(1); YCenter = centroid(2);
    % Is it a Coral in Coral case? Does it have a parent?
    if ~isempty(allMasks{ind,8})
        coralInCoralParentInd = allMasks{ind,8};
    end
    
    %%%% STATUS %%%%%%%%
    conditionID = userData.Status;
    %%% BLEACHED %%%%
    bleachedRate = userData.PercentBleached;
    %%% isPartial? %%%%%
    isPartial = userData.isPartial;
    %%% Comments %%%%%
    comments = userData.Remark;
    %%% Species %%%%
    speciesValue = userData.Species;
    speciesName = Species(speciesValue);
    SpeciesID = fetch(conn,['SELECT ID FROM Species where Name = ','''',speciesName{1},'''']);
    
    % What number in the Samples table?
    % 1 New 2 Old 3 Dead 4 Bleached 5 Unknown
    if conditionID == 1 % New coral
        % First add to corals table
        maxIDCorals = fetch(conn,'SELECT ID FROM Corals WHERE ID = (SELECT max(ID) FROM Corals)');
        if isempty(maxIDCorals)
            coralNum = 1;
        else
            coralNum = maxIDCorals{1} + 1;
        end
        % Insert into corals table
        insertdata = {coralNum,SpeciesID{1},PointID,DirectionID};
        insertIntoCoralsTable(insertdata);
    elseif conditionID == 2
    coralNum = str2double(userData.CoralID);
    elseif conditionID == 3 | conditionID == 4% DEAD OR BLEACHED
        % Assign the ID of the parent. Here we assume parent already has
        % ID.
        if ~isempty(coralInCoralParentInd)
            coralNum = NMP_updateParent(allMasks,coralInCoralParentInd,samplePointDirID,imgName);
        else
            coralNum = str2double(userData.CoralID);
        end
    elseif conditionID == 5 % OTHER
    end

    %Just add to the Samples table as a new observation of an old coral
    % Does this coral have a sample id?
    %%% Path where coral mask will be saved (not in database)
    maskMatPath = fullfile(maskFolder,[imgName(1:end-4),'_coralNum_',num2str(coralNum),'_sampleNum_',num2str(sampleID),'_data.mat']);

    if sampleID ==0
        maxID = fetch(conn,'SELECT ID FROM Samples WHERE ID = (SELECT max(ID) FROM Samples)');
        if isempty(maxID)
            sampleID = 1;
        else
            sampleID = maxID{1} + 1;
        end
        %%% Path where coral mask will be saved (not in database)
        maskMatPath = fullfile(maskFolder,[imgName(1:end-4),'_coralNum_',num2str(coralNum),'_sampleNum_',num2str(sampleID),'_data.mat']);
        
        % Insert into samples table
        insertdata = {sampleID,coralNum,samplePointDirID,area,bleachedRate,conditionID,XCenter,YCenter,maskMatPath,isPartial,comments};
        insertIntoSamplesTable(insertdata)
    else % User is updating an existing coral. Things they can update are mask and properties.
        
        updateSamplesTable(coralNum,area,XCenter,YCenter,isPartial,sampleID);
        % Point and Direction will be the same. Only species can change.
        updateCoralsTable(SpeciesID,coralNum)
    end
    
    % Save the masks to the local folder
    save(maskMatPath,'userData','coralMask')
    % Now that everything is saved, update the Figure
    NMP_drawFigure(0,figData);
    % set properties to default
    NMP_setDefaultValues(guihandles(NMP_propertiesWindow))
else
    return
end

