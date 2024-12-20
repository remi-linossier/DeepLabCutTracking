% rotate 90 degrees clockwise videos from a folder 
inputFolder = 'C:\stage_remi_linossier\video_miroir\video_apres_inversion';

% videos listing
videoFiles = dir(fullfile(inputFolder, '*.mp4')); % Modifiez l'extension si nécessaire

for k = 1:length(videoFiles)
    inputFileName = fullfile(inputFolder, videoFiles(k).name);
    
    [~, name, ext] = fileparts(inputFileName);
    tempFileName = fullfile(inputFolder, [name '_temp' ext]);
    
    videoReader = VideoReader(inputFileName);
    videoWriter = VideoWriter(tempFileName, 'MPEG-4');
    
    videoWriter.FrameRate = videoReader.FrameRate;
    
    open(videoWriter);
    
    while hasFrame(videoReader)
        frame = readFrame(videoReader);
        rotatedFrame = imrotate(frame, -90); % Tourner de 90 degrés vers la droite
        writeVideo(videoWriter, rotatedFrame);
    end
    
    close(videoWriter);
    
    delete(inputFileName);
    
    movefile(tempFileName, inputFileName);
    
    disp(['Processed and saved: ' inputFileName]);
end

disp('All videos have been processed.');
