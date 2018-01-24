function newMask = NMP_editBoundaries(him,mask)

NMP_mainWindow;
% Obtain the boundaries of the mask as xy pairs
poly = mask2poly(mask,'outer','mindist');
% Downsample the list of points found to roughly 15 pairs
poly_sm = downsample(poly,30);


pix = impoly(get(NMP_mainWindow,'currentAxes'),poly_sm);
position = wait(pix);
newMask = createMask(pix,him);
delete(pix);











