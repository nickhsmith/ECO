function pause_vid_val = pause_video(hObject,eventdata)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp("Resetting the bounding box")
assignin('caller','reset_box',true)
end
