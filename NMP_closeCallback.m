function NMP_closeCallback(hObject,eventdata,handles)
if hObject.Value == 1
    disp('Goodbye!');
    close all force;
    return;
end