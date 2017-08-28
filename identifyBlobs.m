% identify minimum and maximum shape areas
Amin = 3000;
Amax = 30000;

%create array of images to iterate over
colours = cell(1,3);
colours{1,1} = imrThings;
colours{1,2} = imgThings;
colours{1,3} = imbThings;

%identify all shapes of all colours
for i = 1:length(colours)
    blobs = iblobs(colours{1,i},  'area', [Amin, Amax], 'boundary');
    blobs.plot_box(findBoxColour(i));
    %plot_point([redBlobs(2).uc redBlobs(2).vc]', '*', 'label', getShape(redBlobs(2)));

    for j = 1:length(blobs)
        plot_point([blobs(j).uc blobs(j).vc]', 'g*', 'label', getShape(blobs(j)));
    end
end