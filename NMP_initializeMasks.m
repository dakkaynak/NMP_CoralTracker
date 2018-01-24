function [existingMasksCurrentYear,labelMapCurrentYear,insideMasks,allMasks] = NMP_initializeMasks(y,s,imgName)

if y
    existingMasksCurrentYear = zeros(s(1),s(2),s(3));
    labelMapCurrentYear = existingMasksCurrentYear;
    insideMasks = existingMasksCurrentYear;
    allMasks = {};
else % existing image - load and show all masks
    [existingMasksCurrentYear,labelMapCurrentYear,allMasks,insideMasks] = NMP_loadAllMasksPerImage(imgName);
end



