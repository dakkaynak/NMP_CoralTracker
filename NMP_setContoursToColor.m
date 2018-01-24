function outImg = NMP_setContoursToColor(inImg,mask,color)

mask = logical(mask);
inImg = double(inImg);
s = size(mask);
mask = reshape(mask,[s(1)*s(2) 1]);
inImg = reshape(inImg,[s(1)*s(2) 3]);
inImg(mask,1) = color(1);
inImg(mask,2) = color(2);
inImg(mask,3) = color(3);
outImg = reshape(inImg,[s(1) s(2) 3]);
