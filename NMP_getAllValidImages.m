function imageList = NMP_getAllValidImages(imageFolder,diveSitesRetrieved)

images = {};
imageList = struct('name','','year',[]);
for i = 1:numel(diveSitesRetrieved)
    thisFolder = diveSitesRetrieved(i).name;
    filesInFolder = dir(fullfile(imageFolder,thisFolder,'*.JPG'));
    images = [images;{filesInFolder.name}'];
end

% Get rid of the extension
images = strrep(images,'.JPG','');

% Get rid of the year
for i = 1:numel(images)
    thisImage = images{i};
    imageList(i).name = thisImage(1:end-3);
    imageList(i).year = ['20',thisImage(end-1:end)];
end
