function varargout = NMP_propertiesWindow(varargin)
% NMP_PROPERTIESWINDOW MATLAB code for NMP_propertiesWindow.fig
%      NMP_PROPERTIESWINDOW, by itself, creates a new NMP_PROPERTIESWINDOW or raises the existing
%      singleton*.
%
%      H = NMP_PROPERTIESWINDOW returns the handle to a new NMP_PROPERTIESWINDOW or the handle to
%      the existing singleton*.
%
%      NMP_PROPERTIESWINDOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NMP_PROPERTIESWINDOW.M with the given input arguments.
%
%      NMP_PROPERTIESWINDOW('Property','Value',...) creates a new NMP_PROPERTIESWINDOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NMP_propertiesWindow_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NMP_propertiesWindow_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NMP_propertiesWindow

% Last Modified by GUIDE v2.5 20-Jan-2018 09:59:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NMP_propertiesWindow_OpeningFcn, ...
                   'gui_OutputFcn',  @NMP_propertiesWindow_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before NMP_propertiesWindow is made visible.
function NMP_propertiesWindow_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NMP_propertiesWindow (see VARARGIN)

% Choose default command line output for NMP_propertiesWindow
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NMP_propertiesWindow wait for user response (see UIRESUME)
% uiwait(handles.NMP_propertiesWindow);


% --- Outputs from this function are returned to the command line.
function varargout = NMP_propertiesWindow_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function NMP_coralRemark_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_coralRemark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NMP_coralRemark as text
%        str2double(get(hObject,'String')) returns contents of NMP_coralRemark as a double


% --- Executes during object creation, after setting all properties.
function NMP_coralRemark_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_coralRemark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in NMP_resetProperties.
function NMP_resetProperties_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_resetProperties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NMP_resetPropertiesCallback(hObject,eventdata,handles)


% --- Executes on button press in NMP_saveProperties.
function NMP_saveProperties_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_saveProperties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NMP_saveCoralData(hObject,eventdata,handles)


% --- Executes on selection change in NMP_coralStatus.
function NMP_coralStatus_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_coralStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NMP_coralStatus contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NMP_coralStatus


% --- Executes during object creation, after setting all properties.
function NMP_coralStatus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_coralStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in NMP_coralType.
function NMP_coralType_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_coralType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NMP_coralType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NMP_coralType
NMP_typeCallback(hObject,eventdata,handles)


% --- Executes during object creation, after setting all properties.
function NMP_coralType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_coralType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in NMP_coralGenus.
function NMP_coralGenus_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_coralGenus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NMP_coralGenus contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NMP_coralGenus
NMP_genusCallback(hObject,eventdata,handles)


% --- Executes during object creation, after setting all properties.
function NMP_coralGenus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_coralGenus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in NMP_coralSpecies.
function NMP_coralSpecies_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_coralSpecies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NMP_coralSpecies contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NMP_coralSpecies
NMP_speciesCallback(hObject,eventdata,handles)


% --- Executes during object creation, after setting all properties.
function NMP_coralSpecies_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_coralSpecies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NMP_coralPercentBleached_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_coralPercentBleached (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NMP_coralPercentBleached as text
%        str2double(get(hObject,'String')) returns contents of NMP_coralPercentBleached as a double


% --- Executes during object creation, after setting all properties.
function NMP_coralPercentBleached_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_coralPercentBleached (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NMP_areaEdit_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_areaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NMP_areaEdit as text
%        str2double(get(hObject,'String')) returns contents of NMP_areaEdit as a double


% --- Executes during object creation, after setting all properties.
function NMP_areaEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_areaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NMP_coralIDEdit_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_coralIDEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NMP_coralIDEdit as text
%        str2double(get(hObject,'String')) returns contents of NMP_coralIDEdit as a double


% --- Executes during object creation, after setting all properties.
function NMP_coralIDEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_coralIDEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NMP_locationIDEdit_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_locationIDEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NMP_locationIDEdit as text
%        str2double(get(hObject,'String')) returns contents of NMP_locationIDEdit as a double


% --- Executes during object creation, after setting all properties.
function NMP_locationIDEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_locationIDEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in NMP_coralCoverage.
function NMP_coralCoverage_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_coralCoverage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NMP_coralCoverage contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NMP_coralCoverage


% --- Executes during object creation, after setting all properties.
function NMP_coralCoverage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_coralCoverage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close NMP_propertiesWindow.
function NMP_propertiesWindow_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to NMP_propertiesWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
%delete(hObject);


% --- Executes on selection change in NMP_isPartial.
function NMP_isPartial_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_isPartial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NMP_isPartial contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NMP_isPartial


% --- Executes during object creation, after setting all properties.
function NMP_isPartial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_isPartial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
