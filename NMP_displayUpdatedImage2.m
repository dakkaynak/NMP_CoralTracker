function him = NMP_displayUpdatedImage2(inImg,labelMap,overallMask,insideMasks,imgName,handles)

% overallMask is already color coded

% Set these pixels in the image to zero, so the colors look OK

s = size(inImg);
A = 0.9;
% Coloring the contours
contourMask = logical(sum(overallMask,3));
imgWithZeros = NMP_setContoursToZero(inImg,contourMask);
% Coloring the inside of corals
imgWithFilledInside = uint8(A.*double(imgWithZeros) + (1-A).*double(insideMasks));

% Show the image
finalImage = imgWithFilledInside + uint8(255*overallMask) + uint8(255*labelMap);
finalImage = insertText(finalImage,[ceil(0.5*s(2)), 0.5*s(1)],imgName,'Fontsize',40);

currentAx = get(gcf);
set(0,'currentfigure',eval(currentAx.Name));
him = imshow(finalImage,'Parent',currentAx.CurrentAxes);
%akZoom('lmr');
%zoom on
drawnow