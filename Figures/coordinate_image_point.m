% script for select two points in an image and print there coordinates (in
% pixels) 

% load image
[filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp', 'Images (*.jpg, *.png, *.bmp)'; '*.*', 'Tous les fichiers'}, 'Sélectionner une image');
if isequal(filename, 0)
    disp('Aucune image sélectionnée. Fin du programme.');
    return;
end

% read and show image 
imagePath = fullfile(pathname, filename);
img = imread(imagePath);
imshow(img);
title('Cliquez sur deux points de l''image');

% select the two points 
[x, y] = ginput(2);

% print the coordinates 
fprintf('Coordonnées du premier point : (%.2f, %.2f)\n', x(1), y(1));
fprintf('Coordonnées du deuxième point : (%.2f, %.2f)\n', x(2), y(2));
