function coloredInside = NMP_colorInsideCoral(mask,boundaryMask,colorInside)

% colorRim is in [0,1]
% colorInside is in [0, 255];

% Assumes nothing about the image onto which the contours will be overlaid

% If no color is specified, default to blue
if nargin<3
    colorInside = [255 255 255];
end

% Get the boundaries of the found coral, ie mask.
s = size(mask);

insideMask = mask - boundaryMask;
boundaryMask = reshape(boundaryMask,[s(1)*s(2) 1]);
insideMask = logical(reshape(insideMask,[s(1)*s(2) 1]));

coloredInside  = zeros(s(1)*s(2),3);

% Add the color for each blue.
for i = 1:3
    coloredInside(insideMask,i) = colorInside(i); 
end

% This gets rid of the rim.
temp = coloredInside;
temp(~boundaryMask,:) = 0;
coloredInside = coloredInside - temp;

coloredInside = reshape(coloredInside,[s(1) s(2) 3]);

