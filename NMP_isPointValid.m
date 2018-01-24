function activeCoralInd = NMP_isPointValid(allMasks,XY)
activeCoralInd = [];
if ~isempty(XY)
    if XY(1,1) >0 && XY(1,2) >0
        for i = 1:size(allMasks,1)
            thisMask = allMasks{i,1};
            if ~isempty(thisMask)
                if thisMask(XY(1,2),XY(1,1))==1
                    activeCoralInd = i;
                    break
                end
            end
        end
    end
end