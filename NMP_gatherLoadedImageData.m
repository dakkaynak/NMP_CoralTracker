function figData = NMP_gatherLoadedImageData(img,imgName,y,labelMapCurrentYear,existingMasksCurrentYear,insideMasks,him,...
   allMasks,site,point,direction,year,s,h)

figData.NMP_img = img;
figData.NMP_imgName = imgName;
figData.NMP_newImgFlag = y;
figData.NMP_labelMapCurrentYear = labelMapCurrentYear;
figData.NMP_existingMasksCurrentYear = existingMasksCurrentYear;
figData.NMP_insideMasks = insideMasks;
figData.NMP_him = him;
figData.NMP_allMasks = allMasks;
figData.NMP_changesToSave = 0;
figData.NMP_activeCoralNum = [];
figData.NMP_clickedPoint = [];
figData.NMP_site = site;
figData.NMP_point = point;
figData.NMP_direction = direction;
figData.NMP_currentYear = year;
figData.NMP_imageSize = s;
figData.NMP_fig = h;

[siteID,pointID,directionID,samplePointDirID] = NMP_getSitePointDirIDs(site,point,direction,imgName,year);

% Pass them to the figure
figData.NMP_siteID = siteID;
figData.NMP_pointID = pointID;
figData.NMP_directionID = directionID;
figData.NMP_samplePointDirID = samplePointDirID;

