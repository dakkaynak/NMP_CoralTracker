function labelMap = NMP_updateLabelMap(allMasks)

if ~isempty(allMasks)
    s = size(allMasks{1,1});
    labelMap = zeros(s(1),s(2),3);
    
    for i = 1:size(allMasks,1)
        thisMask = allMasks{i,1};
        if ~isempty(thisMask)
            labelMap = labelMap + NMP_labelCoralsInImage(allMasks{i,1},allMasks{i,3},allMasks{i,4});
        end
    end
else
    labelMap = [];
    
end