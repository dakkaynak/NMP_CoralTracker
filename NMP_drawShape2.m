function [newMask,pts] = NMP_drawShape2(ax,h_im,closedFlag)
if nargin<3
    closedFlag = true;
end
%pts = imfreehand(ax,'Closed',closedFlag);
[~,xs,ys] = NMP_freehanddraw(ax,'color','b','linewidth',3);
pts = [xs ys];

h = guidata(NMP_mainWindow);
s = h.NMP_imageSize;
newMask = poly2mask(xs,ys,s(1),s(2));

%pts.Deletable = 'true';
%position = wait(pts);
% if isvalid(pts)
%     newMask = pts.createMask(h_im);
%     delete(pts)
% else
%     imgSize = size(h_im.CData);
%     newMask = zeros(imgSize(1),imgSize(2));
% end
% 
% end