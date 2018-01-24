function labelMap = NMP_labelCoralsInImage(L,coralNum,coralGenus)

stats = regionprops(L,'Centroid');
labelMap = zeros(size(L,1),size(L,2),3);
C = stats.Centroid;
%labelMap = insertText(double(labelMap),[C(1) C(2)],coralGenus,'boxopacity',0,'textcolor','w','fontsize',35,'AnchorPoint','Center');
%labelMap = insertText(double(labelMap),[C(1) C(2)+40],coralNum,'boxopacity',0,'textcolor','w','fontsize',35,'AnchorPoint','Center');
% Is it faster if we do it in one all?

labelMap = insertText(double(labelMap),[C(1) C(2);C(1) C(2)+40],{coralGenus{1},num2str(coralNum)},'boxopacity',0,'textcolor','w','fontsize',35,'AnchorPoint','Center');




