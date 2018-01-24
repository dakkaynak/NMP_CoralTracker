function [coloredMask,coloredInside] = NMP_colorContours(mask,colorRim,colorInside)

% colorRim is in [0,1]
% colorInside is in [0, 255];

% Assumes nothing about the image onto which the contours will be overlaid

% If no color is specified, default to blue
if nargin<2
    colorRim = [0 0 1];
    colorInside = [255 255 255];
end

% Get the boundaries of the found coral, ie mask.
boundaryMask = bwmorph(bwperim(mask),'dilate',1);
insideMask = mask - boundaryMask;
insideMask = bwmorph(insideMask,'erode',1);

coloredMask = NMP_setContoursToColor(repmat(boundaryMask,[1 1 3]),boundaryMask,255*colorRim);
coloredInside = NMP_setContoursToColor(repmat(insideMask,[1 1 3]),insideMask,colorInside);

