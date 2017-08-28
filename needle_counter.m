%Needle counter

%import needle image
im = iread('needles_practice.jpg', 'double');
figure(1);
idisp(im);
setUpNImage;

%get edge image
imEdges = isobel(im);

%load sample needle end
needleIm = iread('nTop1.jpg', 'grey', 'double');

%search for needle ends
S = isimilarity(needleIm, imEdges, @zncc);
[mx, p] = peak2(S, 1, 'npeaks', 70);
%plot_circle(p, 30, 'fillcolor', 'b', 'alpha', 0.32, 'edgecolor', 'none'); 
p = p(:,mx>0.34);
plot_circle(p, 30, 'fillcolor', 'g', 'alpha', 0.32, 'edgecolor', 'r'); 

%return amount of end matches found that are over a certain certainty threshold
disp(length(p));
plot_point([100, 100]','textcolor', 'white', 'textsize', 30, 'printf', {'Needles: %d', length(p)}, 'g');