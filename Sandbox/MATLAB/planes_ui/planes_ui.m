function varargout = planes_ui(varargin)
% PLANES_UI MATLAB code for planes_ui.fig
%      PLANES_UI, by itself, creates a new PLANES_UI or raises the existing
%      singleton*.
%
%      H = PLANES_UI returns the handle to a new PLANES_UI or the handle to
%      the existing singleton*.
%
%      PLANES_UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLANES_UI.M with the given input arguments.
%
%      PLANES_UI('Property','Value',...) creates a new PLANES_UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before planes_ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to planes_ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help planes_ui

% Last Modified by GUIDE v2.5 26-Mar-2015 03:09:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @planes_ui_OpeningFcn, ...
                   'gui_OutputFcn',  @planes_ui_OutputFcn, ...
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


% --- Executes just before planes_ui is made visible.
function planes_ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to planes_ui (see VARARGIN)

% Create data to plot
handles.planes1 = imread('planes1.jpg');
handles.planes2 = imread('planes2.jpg');
diff = handles.planes1 - handles.planes2;
handles.diff = diff;

% Set the current data value
val = get(handles.slider1, 'Value');
d = 'Difference >=';
set(handles.text1, 'String', {d val});
binaryImage = diff >= val;
imagesc(binaryImage);
axis off;
colormap(summer);

% Choose default command line output for planes_ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes planes_ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = planes_ui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = get(hObject, 'Value');
d = 'Difference >=';
set(handles.text1, 'String', {d val});
binaryImage = handles.diff >= val;
imagesc(binaryImage);
axis off;

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str = get(hObject, 'String');
val = get(hObject, 'Value');
switch str{val};
    case 'Summer'
        colormap(summer)
    case 'Autumn'
        colormap(autumn)
    case 'Winter'
        colormap(winter)
    case 'Spring'
        colormap(spring)
end
guidata(hObject,handles)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
