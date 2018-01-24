function outImg = NMP_setContoursToZero(inImg,mask)

mask = logical(mask);
s = size(mask);
mask = reshape(mask,[s(1)*s(2) 1]);
inImg = reshape(inImg,[s(1)*s(2) 3]);
inImg(mask,:) = 0;
outImg = reshape(inImg,[s(1) s(2) 3]);
