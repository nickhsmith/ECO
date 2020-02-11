function [seq, ground_truth] = load_video_info(video_path,frame_select)

%ground_truth = dlmread([video_path '/groundtruth_rect.txt']);

seq.len = numel(dir([video_path '/*'])) - 2 ;
ground_truth = zeros(seq.len,4);
seq.format = 'otb';
%seq.len = size(ground_truth, 1);
%seq.init_rect = ground_truth(1,:);

frame_select
img_path = [video_path '/'];
if exist([img_path num2str(1, '%04i.png')], 'file'),
    img_files = num2str((1:frame_select:seq.len)', [img_path '%04i.png']);
elseif exist([img_path num2str(1, '%04i.jpg')], 'file'),
    img_files = num2str((1:frame_select:seq.len)', [img_path '%04i.jpg']);
elseif exist([img_path num2str(1, '%04i.bmp')], 'file'),
    img_files = num2str((1:frame_select:seq.len)', [img_path '%04i.bmp']);
else
    error('No image files to load.')
end

seq.s_frames = cellstr(img_files);
frame1 = imread(seq.s_frames{1});
disp("Select a Bounding Box on the Screen")
pause(1);
imshow(frame1);
seq.init_rect = getrect;
close;
end

