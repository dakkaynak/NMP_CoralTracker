function him = NMP_displayUpdatedImageCompWindow(inImg,labelMap,overallMask,imgName,handles)

% overallMask is already color coded

% Set these pixels in the image to zero, so the colors look OK

s = size(inImg);

contourMask = logical(sum(overallMask,3));
imgWithZeros = NMP_setContoursToZero(inImg,contourMask);

% Show the image
finalImage = imgWithZeros + uint8(255*overallMask) + uint8(255*labelMap);
finalImage = insertText(finalImage,[ceil(0.5*s(2)), 0.5*s(1)],imgName,'Fontsize',40);

set(0,'currentfigure',handles.NMP_comparisonWindow);
him = imshow(finalImage,'Parent',handles.NMP_comparisonWindow.CurrentAxes);
%akZoom('lmr');
%zoom on
drawnow