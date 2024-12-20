% create a graph with expermental point of the trajectory and theorical
% trajectory 

% 1. read CSV file 
filename = 'C:\stage_remi_linossier\v2_720p-remi_linossier-2024-12-12\videos\erreur_3d.csv';  
data = readmatrix(filename);

% extract coordinates x and y from columns 32 and 33 from line 4
x = data(4:end, 32);  
y = data(4:end, 33);  

% 2. Create a graph 
figure;
scatter(x, y, 10, 'b', 'filled');  

% 3. title and labels 
title('Graphique des points CSV avec une droite tracée');
xlabel('Coordonnées x (pixels)');
ylabel('Coordonnées y (pixels)');

% 4. Configuration of axis 
set(gca, 'YDir', 'reverse');  
axis tight;  
grid on;  

% 5. white background 
set(gca, 'Color', 'w');  

% 6. coordinates of two points of the theorical trajectory 
x1 = 153.0628; 
y1 = 18.5905;  
x2 = 502.0075;  
y2 = 304.8216;  

% 7. print the theorical trajectory 
hold on;  
plot([x1, x2], [y1, y2], 'r-', 'LineWidth', 0.5);  

hold off;  
