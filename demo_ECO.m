
% This demo script runs the ECO tracker with deep features on the
% included "Crossing" video.

% Add paths
setup_paths();

% Load video information
video_path = uigetdir('C:\',"Folder containing images");
disp(video_path)
record_video = input("Would you like to record the resulting tracking video? Please type 1 (and hit enter) in order to record:\n") % 
if record_video == 1
	output_video_path = uigetdir('C:\')
    write_video = true;
    output_name = 'Tracker_Result_video.avi';
else
    write_video = false;
    output_video_path = "";
end
frame_select = input("Select which Frames to select\nfor frame_select = 3; every third frame is selected. Ex. A video in 30hz is now 10hz:\n") % for frame_select = 3; every third frame is selected. Ex. A video in 30hz is now 10hz
[seq, ground_truth] = load_video_info(video_path,frame_select);
disp(seq)

% Run ECO
results = testing_ECO(seq,write_video,output_video_path);
