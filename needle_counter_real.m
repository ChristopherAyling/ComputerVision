% Setup
im = iread('needles_practice.png');
setupNImageThresh;
pauseLength = 10;

% 1. Display a binary image where only the ring-shaped tips of the
%    protective caps are visible. The program will then pause. 

needlesBinary = (imB>0.5); figure(1); idisp(needlesBinary);
pause(pauseLength);

% 2. Segment the needle caps. Display the segment centroids in the binary
%    image used above. The program will then pause. 
Amin = 1000; Amax = 10000;
needles = iblobs(needlesBinary, 'area', [Amin, Amax], 'class', 0);
for i = 1:length(needles)
    plot_point([needles(i).uc needles(i).vc]', 'g*');
end
pause(pauseLength);

% 3. Automatically determine and report the number of needles. 
plot_point([100, 100]','textcolor', 'white', 'textsize', 30, 'printf', {'Needles: %d', length(needles)}, 'g');