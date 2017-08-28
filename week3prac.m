gammaC = 2.5;

circThresh = 0.9;
triThresh = 0.55;
squareThresh = 0.7;

im = iread('blobpic1.jpg');
im = imresize(im, 0.5);
idisp(im);

imGrey = iread('blobpic1.jpg', 'grey', 'double');
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
imbThings = imb>0.5;

%red shapes
%figure(2)
%idisp(imrThings)
redBlobs = iblobs(imrThings,  'area', [10000, 300000], 'boundary');
redBlobs.plot_box('r');
plot_point([redBlobs(2).uc redBlobs(2).vc]', '*', 'label', getShape(redBlobs(2)))



%label everything
%figure(2)
%idisp(imb)
%figure(3)
%idisp(imbThings)

%task 1
%b = iblobs(imbThings, 'area', [70000, 300000], 'boundary' );
%b.plot_box('g');
%b.plot_centroid('r*');

%shapes = iblobs(imGreyThings);
%shapes.plot_box('g');
%shapes.plot_centroid('r*');
%disp('3')
%task 2

%red shapes
redBlobs = iblobs(imrThings,  'area', [1000, 300000], 'boundary');
redBlobs.plot_box('r');
%plot_point([redBlobs(2).uc redBlobs(2).vc]', '*', 'label', getShape(redBlobs(2)));

for i = 1:length(redBlobs)
    plot_point([redBlobs(i).uc redBlobs(i).vc]', 'g*', 'label', getShape(redBlobs(i)));

end