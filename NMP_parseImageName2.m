function [site,point,direction,year] = NMP_parseImageName2(imgName)

spaces = find(isspace(imgName));
site = imgName(1:spaces(1)-1);
point = imgName(spaces(1)+1:spaces(2)-1);
direction = imgName(spaces(2)+numel(point):spaces(3));
year = str2double(['20',imgName(spaces(3)+1:spaces(3)+2)]);


