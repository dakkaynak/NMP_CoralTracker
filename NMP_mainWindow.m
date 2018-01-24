function varargout = NMP_mainWindow(varargin)
% NMP_MAINWINDOW MATLAB code for NMP_mainWindow.fig
%      NMP_MAINWINDOW, by itself, creates a new NMP_MAINWINDOW or raises the existing
%      singleton*.
%
%      H = NMP_MAINWINDOW returns the handle to a new NMP_MAINWINDOW or the handle to
%      the existing singleton*.
%
%      NMP_MAINWINDOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NMP_MAINWINDOW.M with the given input arguments.
%
%      NMP_MAINWINDOW('Property','Value',...) creates a new NMP_MAINWINDOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NMP_mainWindow_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NMP_mainWindow_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NMP_mainWindow

% Last Modified by GUIDE v2.5 21-Jan-2018 21:42:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NMP_mainWindow_OpeningFcn, ...
                   'gui_OutputFcn',  @NMP_mainWindow_OutputFcn, ...
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


% --- Executes just before NMP_mainWindow is made visible.
function NMP_mainWindow_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NMP_mainWindow (see VARARGIN)

global imageFolder imageList maskFolder conn Genus Types Species Status

% Choose default command line output for NMP_mainWindow
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%%%%%% DATABASE CONNECTION %%%%%%%%%%%%
%
% This is the remote database we used with Assaf
% This jar file has to be on my path to connect to the database - Murielle
% will not need this. 
javaaddpath('/Users/deryaakkaynak/Dropbox/NMP Coral Tracker Software from Derya/sqljdbc_6.0/enu/jre7/sqljdbc41.jar');
%conn = database('', 'nmp', 'Sy3iquku39_!', 'Vendor', 'MICROSOFT SQL SERVER', 'Server', 'mssql3.gear.host', 'AuthType', 'Server');

% This is Derya's local sandbox database
conn = sqlite('DeryaSandbox2.db');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This points to the folder with NMP images
imageFolder = '/Users/deryaakkaynak/Dropbox/NMP Coral Tracker Software from Derya/Images';
maskFolder = '/Users/deryaakkaynak/Dropbox/NMP Coral Tracker Software from Derya/Images/Coral Masks';
% Valid dive sites
diveSitesRetrieved = NMP_getDiveSites(imageFolder);
% Valid years
imageList = NMP_getAllValidImages(imageFolder,diveSitesRetrieved);
% Dive sites
diveSites = unique({imageList.name});
handles.NMP_diveSiteDropdown.String = diveSites;

Genus = fetch(conn,'SELECT Name FROM Genuses');
Types = fetch(conn,'SELECT Name FROM Types');
Species = fetch(conn,'SELECT Name FROM Species');
Status = fetch(conn,'SELECT Name FROM Conditions');

I = imread('icons/logo.jpg');
if strcmp(get(hObject,'Visible'),'off')
    imshow(I)
end


% UIWAIT makes NMP_mainWindow wait for user response (see UIRESUME)
% uiwait(handles.NMP_mainFig);


% --- Outputs from this function are returned to the command line.
function varargout = NMP_mainWindow_OutputFcn(hObject, eventdata, handles) 
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
NMP_currentYearCallback(hObject, eventdata,handles)


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


% --- Executes on button press in NMP_loadButton.
function NMP_loadButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_loadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NMP_loadCallback(hObject, eventdata,handles)


% --- Executes on selection change in NMP_diveSiteDropdown.
function NMP_diveSiteDropdown_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_diveSiteDropdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns NMP_diveSiteDropdown contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NMP_diveSiteDropdown
NMP_diveSiteCallback(hObject, eventdata,handles)


% --- Executes during object creation, after setting all properties.
function NMP_diveSiteDropdown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NMP_diveSiteDropdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function NMP_mainFig_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to NMP_mainFig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NMP_figureClickCallback(hObject,eventdata,handles)


% --- Executes when user attempts to close NMP_mainFig.
function NMP_mainFig_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to NMP_mainFig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
%delete(hObject);


% --- Executes on button press in NMP_editButton.
function NMP_editButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_editButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_editButton
NMP_editToggleCallback(hObject, eventdata,handles)


% --- Executes on button press in NMP_drawButton.
function NMP_drawButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_drawButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_drawButton
%NMP_drawNewCoralPolygon(hObject, eventdata,handles)
NMP_drawNewCoral(hObject, eventdata,handles)

% --- Executes on button press in NMP_drawButtonFreehand.
function NMP_drawButtonFreehand_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_drawButtonFreehand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_drawButtonFreehand
%NMP_drawNewCoralFreehand(hObject, eventdata,handles)
NMP_drawNewCoral(hObject, eventdata,handles)

% --- Executes on button press in NMP_cutButton.
function NMP_cutButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_cutButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_cutButton


% --- Executes on button press in NMP_deleteButton.
function NMP_deleteButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_deleteButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_deleteButton
NMP_deleteCallback(hObject, eventdata,handles)


% --- Executes on button press in NMP_mergeButton.
function NMP_mergeButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_mergeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_mergeButton


% --- Executes on button press in NMP_unmergeButton.
function NMP_unmergeButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_unmergeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_unmergeButton


% --- Executes on button press in NMP_fixBoundaryButton.
function NMP_fixBoundaryButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_fixBoundaryButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_fixBoundaryButton
NMP_editCoralCallback(hObject, eventdata,handles)


% --- Executes on button press in NMP_reshapeBoundaryButton.
function NMP_reshapeBoundaryButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_reshapeBoundaryButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_reshapeBoundaryButton


% --------------------------------------------------------------------
function fileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to fileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in NMP_saveButton.
function NMP_saveButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_saveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_saveButton


% --- Executes on button press in NMP_closeButton.
function NMP_closeButton_Callback(hObject, eventdata, handles)
% hObject    handle to NMP_closeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NMP_closeButton
NMP_closeCallback(hObject,eventdata,handles)


% --------------------------------------------------------------------
function uitoggletool4_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

NMP_editToggleCallback(hObject, eventdata,handles)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NMP_figureClickCallback(hObject,eventdata,handles)


% --- Executes on mouse press over figure background.
function NMP_mainFig_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to NMP_mainFig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function NMP_mainFig_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to NMP_mainFig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
