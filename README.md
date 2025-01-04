# Project presentation

I took over a part of the work of Linda Mecherout (https://github.com/lindamecherout/BeeDeckBot-Deeplabcut). The goal of this project is to study the flight of bees using a markerless 3D pose estimation tracking software named DeepLabCut. Especially my goal was to calculate the 3D position error of the tracking done by the software.

# Folders organisation 

- 3dPrinting : 3D model of the fake bee used for the project (printed in 13mm long and 6mm wide.
- Error : MatLab script used to calculate the position error between experimental and theoretical trajectory.
- Figures : MatLab scripts used to get coodrinates of points on a video or a frame and to create a graph with the theoretical and experimental trajectory.
- ImageProcessing : MatLab script used to make the raw videos usable for training the neural network 
