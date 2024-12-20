% calculate the error in two axis 

% 1. load CSV file
filename = 'C:\stage_remi_linossier\v2_720p-remi_linossier-2024-12-12\videos\erreur_3d.csv';  % replace by your path 
data = readmatrix(filename);

% Extraire the coordinates x and y of the file (placed in the column 32 and
% 33 from the line 4)
x = data(4:end, 32);  
y = data(4:end, 33); 

% 2.define the coordinates (in pixels) of the two points of the theorical
% line
x1 = 153.0628; 
y1 = 18.5905; 
x2 = 502.0075;  
y2 = 304.8216;  

% 3. calculate the error (in pixels) for each points in x and y
errors_x = zeros(length(x), 1);  
errors_y = zeros(length(x), 1);  

for i = 1:length(x)
    dx = x2 - x1;
    dy = y2 - y1;
    
    t = ((x(i) - x1) * dx + (y(i) - y1) * dy) / (dx^2 + dy^2);
    
    x_proj = x1 + t * dx;
    y_proj = y1 + t * dy;
    
    errors_x(i) = abs(x(i) - x_proj); 
    errors_y(i) = abs(y(i) - y_proj);  
end

% 4. Put the error in columns 34 and 35 from line 4
data(4:end, 34) = errors_x;  
data(4:end, 35) = errors_y;  

% 5. download the new CSV file 
new_filename = 'C:\stage_remi_linossier\v2_720p-remi_linossier-2024-12-12\videos\erreur_3d.csv';  % Nouveau fichier CSV
writematrix(data, new_filename);

% print confirmation message 
disp(['Les erreurs ont été ajoutées au fichier CSV : ', new_filename]);
