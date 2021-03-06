resizeAmount = 0.5;
colourThreshold = 0.5;

gammaC = 2.5;

%im = imresize(im, 0.5);

%imGrey = iread(imagePath, 'grey', 'double');
imRed = im(:,:,1);
imGreen = im(:,:,2);
imBlue = im(:,:,3);

imBlueNormal = double(imBlue)/255;
imGreenNormal = double(imGreen)/255;
imRedNormal = double(imRed)/255;

imR = imRedNormal.^gammaC;
imG = imGreenNormal.^gammaC;
imB = imBlueNormal.^gammaC;

imr = imR./(imR + imG + imB);
img = imG./(imR + imG + imB);
imb = imB./(imR + imG + imB);

imrThings = imr>0.5;
imgThings = img>0.5;
imbThings = imb>0.4;