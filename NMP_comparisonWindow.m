function varargout = NMP_comparisonWindow(varargin)
% NMP_COMPARISONWINDOW MATLAB code for NMP_comparisonWindow.fig
%      NMP_COMPARISONWINDOW, by itself, creates a new NMP_COMPARISONWINDOW or raises the existing
%      singleton*.
%
%      H = NMP_COMPARISONWINDOW returns the handle to a new NMP_COMPARISONWINDOW or the handle to
%      the existing singleton*.
%
%      NMP_COMPARISONWINDOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NMP_COMPARISONWINDOW.M with the given input arguments.
%
%      NMP_COMPARISONWINDOW('Property','Value',...) creates a new NMP_COMPARISONWINDOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NMP_comparisonWindow_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NMP_comparisonWindow_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NMP_comparisonWindow

% Last Modified by GUIDE v2.5 19-Jan-2018 14:59:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NMP_comparisonWindow_OpeningFcn, ...
                   'gui_OutputFcn',  @NMP_comparisonWindow_OutputFcn, ...
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


% --- Executes just before NMP_comparisonWindow is made visible.
function NMP_comparisonWindow_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NMP_comparisonWindow (see VARARGIN)

% Choose default command line output for NMP_comparisonWindow
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes NMP_comparisonWindow wait for user response (see UIRESUME)
% uiwait(handles.NMP_comparisonWindow);


% --- Outputs from this function are returned to the command line.
function varargout = NMP_comparisonWindow_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in NMP_yearDropdown.
function NMP_yearDropdown_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_yearDropdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NMP_yearDropdown contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NMP_yearDropdown
NMP_pastYearCallback(hObject, eventdata,handles)

% --- Executes during object creation, after setting all properties.
function NMP_yearDropdown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_yearDropdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in NMP_compLoadButton.
function NMP_compLoadButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_compLoadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NMP_comparisonLoadCallback(hObject,eventdata,handles)

% --- Executes when user attempts to close NMP_comparisonWindow.
function NMP_comparisonWindow_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to NMP_comparisonWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
%delete(hObject);


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NMP_figureClickCallback(hObject,eventdata,handles)


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function NMP_comparisonWindow_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to NMP_comparisonWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NMP_figureClickCallback(hObject,eventdata,handles)
