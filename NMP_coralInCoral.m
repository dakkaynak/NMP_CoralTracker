function allMasks = NMP_coralInCoral(allMasks,activeCoralInd)

thisMask = allMasks{activeCoralInd,1};
areaThisMask = sum(thisMask(:));

for i = 1:size(allMasks,1)
    if i ~= activeCoralInd
        thisOtherMask = allMasks{i,1};
        overlap = (thisOtherMask + thisMask)==2;
        if sum(overlap(:)) >0.99 * areaThisMask % This is a coral within a coral
            overlappingCoralInd = i;
            allMasks{overlappingCoralInd,1} = thisOtherMask - thisMask;
            % allMasks{ind,8} will carry Coral in Coral association
            allMasks{overlappingCoralInd,8} = activeCoralInd;
            allMasks{activeCoralInd,8} = overlappingCoralInd;
        end
    end
end




