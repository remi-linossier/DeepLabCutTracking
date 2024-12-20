% remove distortion of videos with camera parameters 

inputFolder = 'C:\stage_remi_linossier\video_miroir\video_apres_inversion';
outputFolder = 'C:\stage_remi_linossier\video_miroir\video_apres_inversion\video_distordue';

if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% list the  videos of the input folder 
videoFiles = dir(fullfile(inputFolder, '*.mp4'));

% be sure to have your camera parameters in your matlab work space  

% process each video
for i = 1:length(videoFiles)
    inputVideoPath = fullfile(videoFiles(i).folder, videoFiles(i).name);
    [~, videoName, ~] = fileparts(videoFiles(i).name);
    outputVideoPath = fullfile(outputFolder, [videoName '_corrected.mp4']);


    v = VideoReader(inputVideoPath);

    outputVideo = VideoWriter(outputVideoPath, 'MPEG-4');
    outputVideo.FrameRate = v.FrameRate; % keep the same frame rate
    open(outputVideo);

    % apply correction image by image 
    while hasFrame(v)
        frame = readFrame(v); % read image 
        frameUndistorted = undistortImage(frame, cameraParams); % remove distortion
        writeVideo(outputVideo, frameUndistorted); % download new image
    end

    
    close(outputVideo);

    
    fprintf('Vidéo "%s" corrigée et enregistrée dans "%s".\n', videoFiles(i).name, outputVideoPath);
end

fprintf('Toutes les vidéos ont été corrigées.\n');