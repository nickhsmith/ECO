
% This demo script runs the ECO tracker with deep features on the
% included "Crossing" video.

% Add paths
setup_paths();

% Load video information
video_path = '~/Documents/IDP/videos/Jogo 2/vista_de_cima_split/Vista_de_Cima_Jogo_2_2';
disp(video_path)
frame_select = input("Select which Frames to select\nfor frame_select = 3; every third frame is selected. Ex. A video in 30hz is now 10hz:\n") % for frame_select = 3; every third frame is selected. Ex. A video in 30hz is now 10hz
[seq, ground_truth] = load_video_info(video_path,frame_select);
disp(seq)

% Run ECO
results = testing_ECO(seq);
