function [site,point,direction] = NMP_parseImageName(imgName)

spaces = find(isspace(imgName));
site = imgName(1:spaces(1)-1);
point = imgName(spaces(1)+1:spaces(2)-1);
direction = imgName(spaces(2)+1:end);


