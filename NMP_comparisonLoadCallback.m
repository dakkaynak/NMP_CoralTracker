function NMP_comparisonLoadCallback(hObject, eventdata,handles)

hObject.UserData = 1;
handles = guihandles;

[img,imgName] = NMP_loadImagesCompWindow(handles.NMP_comparisonWindow);
s = size(img);
[y,~] = NMP_isThisAnewImage(imgName);
if y
    existingMasksCurrentYear = zeros(s(1),s(2),s(3));
    labelMapCurrentYear = zeros(s(1),s(2),s(3));
    allMasks = {};
else % existing image - load and show all masks
    [existingMasksCurrentYear,labelMapCurrentYear,allMasks] = NMP_loadAllMasksPerImage(imgName);
end

him = NMP_displayUpdatedImageCompWindow(img,labelMapCurrentYear,existingMasksCurrentYear,imgName,handles);
uiresume(gcbf);
end

