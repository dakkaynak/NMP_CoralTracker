function [newMask,pts] = NMP_drawShape(ax,h_im,closedFlag)
if nargin<3
    closedFlag = true;
end


figData = guidata(NMP_mainWindow);
s = figData.NMP_imageSize;
newMask = zeros(s(1),s(2));

try
    pts = impoly(ax,'Closed',closedFlag);
    pts.Deletable = 'true';
    position = wait(pts);
    if isvalid(pts)
        newMask = pts.createMask(h_im);
        delete(pts)
    else
        imgSize = size(h_im.CData);
        newMask = zeros(imgSize(1),imgSize(2));
    end
    
    
catch err
end