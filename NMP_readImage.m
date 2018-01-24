function Ioriginal = NMP_readImage(folderName,imgName)

% read the image, and resize for speed.
Ioriginal = double(imread(fullfile(folderName,imgName)));

% Some images are doubles, some are uint8, some are uint16. Standardize
% them here all to be uint8s
Ioriginal = Ioriginal./max(Ioriginal(:));
Ioriginal = uint8(255*Ioriginal);
