function [overallMask,overallMaskInside] = NMP_drawOverallMask(allMasks)

if ~isempty(allMasks)
    s = size(allMasks{1,1});
    overallMask = zeros(s(1),s(2),3);
    overallMaskInside = zeros(s(1),s(2),3);
    for i = 1:size(allMasks,1)
        thisMask = allMasks{i,1};
        
        if ~isempty(thisMask)
            rimColor = allMasks{i,2};
            insideColor = allMasks{i,6};
            [contourMask,insideMask] = NMP_colorContours(thisMask,rimColor,insideColor);
            
            overallMask = overallMask + contourMask;
            overallMaskInside = overallMaskInside + insideMask;
        end
    end
else
    overallMask = [];
    overallMaskInside = [];
end