% script for select two points on the first frame of a video to get there
% coordonates (in pixels)

% 1. load video 
filename = 'C:\stage_remi_linossier\v2_720p-remi_linossier-2024-12-12\videos\a_corrected.mp4';  % Remplacez par le chemin de votre vidéo
videoObj = VideoReader(filename);  % Créer un objet vidéo

% 2. show the first frame 
frame = read(videoObj, 1);  
imshow(frame);  
title('Cliquez sur deux points pour obtenir leurs coordonnées en pixels.');

% 3. select two points 
disp('Cliquez sur le premier point');
[x1, y1] = ginput(1);  
disp(['Coordonnée du premier point: (', num2str(x1), ', ', num2str(y1), ')']);

disp('Cliquez sur le deuxième point');
[x2, y2] = ginput(1);  
disp(['Coordonnée du deuxième point: (', num2str(x2), ', ', num2str(y2), ')']);

% 4. show the selected points on the image 
hold on;
plot(x1, y1, 'ro', 'MarkerFaceColor', 'r');  
plot(x2, y2, 'bo', 'MarkerFaceColor', 'b');  
hold off;

% 5. print the coordonites of the points 
disp(['Les coordonnées du premier point sont: (', num2str(x1), ', ', num2str(y1), ')']);
disp(['Les coordonnées du deuxième point sont: (', num2str(x2), ', ', num2str(y2), ')']);
