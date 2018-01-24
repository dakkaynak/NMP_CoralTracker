%function [siteID,pointID,directionID,samplePointDirID] = NMP_getSitePointDirIDs(figData)
function [siteID,pointID,directionID,samplePointDirID] = NMP_getSitePointDirIDs(site,point,direction,imgName,year)
global conn imageFolder

% Site
%site = figData.NMP_site;
siteData = fetch(conn,['SELECT ID FROM Sites WHERE Name = ','''',site,'''']);
siteID = siteData{1};

% Point
%point = figData.NMP_point;
pointData = fetch(conn,['SELECT ID FROM Points WHERE SiteID = ',num2str(siteID),' AND Name = ','''',point,'''']);
pointID = pointData{1};

% Direction
%direction = figData.NMP_direction;
directionData = fetch(conn,['SELECT ID FROM Directions WHERE Name = ','''',direction(1),'''']);
directionID = directionData{1};

% SamplePointsDir
%imagePath = fullfile(imageFolder,figData.NMP_imgName);
imagePath = fullfile(imageFolder,imgName);
%year = figData.NMP_currentYear;
isConvertedFromOld = 0; % Until further notice

% Check if this image exists in this database
data = fetch(conn,['SELECT ID FROM SamplesPointsDirs WHERE ImagePath = ','''',imagePath,'''']);

if isempty(data) % This image needs to be added
    % get the maxID in the database
    maxID = fetch(conn,'SELECT ID FROM SamplesPointsDirs WHERE ID = (SELECT max(ID) FROM SamplesPointsDirs)');
    if isempty(maxID) % First ever entry into this database!
        samplePointDirID = 1;
    else
        samplePointDirID = maxID{1} + 1;
    end
    % Now add the image
    insert(conn,'SamplesPointsDirs',{'ID','PointID','DirectionID','ImagePath','SampleYear','isConvertedFromOld','ImageCreatedTime'},...
        {samplePointDirID,pointID directionID imagePath year isConvertedFromOld now});
else % This image exists!
    samplePointDirID = data{1};
end

