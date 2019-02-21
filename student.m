function varargout = student(varargin)
% STUDENT MATLAB code for student.fig
%      STUDENT, by itself, creates a new STUDENT or raises the existing
%      singleton*.
%
%      H = STUDENT returns the handle to a new STUDENT or the handle to
%      the existing singleton*.
%
%      STUDENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STUDENT.M with the given input arguments.
%
%      STUDENT('Property','Value',...) creates a new STUDENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before student_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to student_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help student

% Last Modified by GUIDE v2.5 27-Oct-2018 16:26:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @student_OpeningFcn, ...
                   'gui_OutputFcn',  @student_OutputFcn, ...
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


% --- Executes just before student is made visible.
function student_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to student (see VARARGIN)


% Choose default command line output for student
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.figure1,'Visible','off');
prompt = {'用户名','密码'};
title = '登陆';
lines = [1,35];
def = {'sby','1896'};
tab = inputdlg(prompt,title,lines,def);
if ~isempty(tab)
    User = tab{1};
    Password = tab{2};
    while 1
        if strcmp(User,'sby') && strcmp(Password,'1896')
            set(handles.figure1,'Visible','on');
            load('newData.mat');
            load('Subject_init.mat');
            set(handles.uitable,'Data',newData);
            set(handles.uitable,'ColumnName',Subject_init);
            set(handles.uitable,'ColumnEditable',true);
            break;
        elseif (strcmp(User,'123') && strcmp(Password,'1896'))...
                ||(strcmp(User,'gingkg') && strcmp(Password,'1997'))
            set(handles.figure1,'Visible','on');
            load('newData.mat');
            load('Subject_init.mat');
            set(handles.uitable,'Data',newData);
            set(handles.uitable,'ColumnName',Subject_init);
            set(handles.uitable,'ColumnEditable',false);
            set(handles.uipanel1,'Visible','off');
            Size = get(handles.figure1,'Position');
            Size(3) = 254.0000-70;
            set(handles.figure1,'Position',Size);
            break;
        else
           % set(handles.figure1,'Visible','off');
            prompt = '用户名或密码错误！';
            title = 'Warning';
            uiwait(warndlg(prompt,title));  
            prompt = {'用户名','密码'};
            title = '登陆';
            lines = [1,35];
            def = {'sby','1896'};
            tab = inputdlg(prompt,title,lines,def);
            if ~isempty(tab)
                User = tab{1};
                Password = tab{2};
            else
                close(gcf);
            end
        end
    end
else
    close;
end


% UIWAIT makes student wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = student_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;
%****************************************************************************
%加上varargout{1} = handles.output这句默认的会在登陆界面点击取消时报以下错误
% 此类型的变量不支持使用点进行索引。
% 
% 出错 student>student_OutputFcn (line 128)
% varargout{1,1} = handles.output;
% 
% 出错 gui_mainfcn (line 264)
%         feval(gui_State.gui_OutputFcn, gui_hFigure, [], gui_Handles);
% 
% 出错 student (line 42)
%     gui_mainfcn(gui_State, varargin{:});
%************************************************************************


% --- Executes on selection change in Class_Number.
function Class_Number_Callback(hObject, eventdata, handles)
% hObject    handle to Class_Number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Class_Number contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Class_Number
Class = get(hObject,'Value');
%disp(Class);

% --- Executes during object creation, after setting all properties.
function Class_Number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Class_Number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function inquire_Callback(hObject, eventdata, handles)
% hObject    handle to inquire (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when entered data in editable cell(s) in uitable.
function uitable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)




% --- Executes when selected cell(s) is changed in uitable.
function uitable_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
hang = eventdata.Indices;
if ~isempty(hang)
%    fprintf('(%d %d)\n',hang);
    hangIndex = hang(1);
    lieIndex = hang(2);
    save('hangIndex.mat','hangIndex');
    save('lieIndex.mat','lieIndex');
    handles.hangIndex = hangIndex;
    handles.lieIndex = lieIndex;
%    fprintf('(%d %d)\n',handles.hangIndex,handles.lieIndex);
%     if exist('handles.hangIndex','class')
%         fprintf('handles.hangIndex存在\n');
%     else
%         fprintf('handles.hangIndex不存在\n');
%     end
    guidata(hObject,handles);
end





% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Add_Student.
function Add_Student_Callback(hObject, eventdata, handles)
% hObject    handle to Add_Student (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%newData = get(handles.uitable,'Data');
%[R L] = size(handles.uitable.Data);
[L,R] = size(get(handles.uitable,'ColumnName'));
% fprintf('%f\n',R);
% fprintf('%f\n',L);
prompt = get(handles.uitable,'ColumnName');
title = '请输入要添加的学生信息';
lines = [1,50];
def = {'2015302118','魏少军'};
for i = 3:L
    def{i} = '60';
end
tab = inputdlg(prompt,title,lines,def);
if ~isempty(tab)
    
    newrow{1} = tab{1};
    newrow{2} = tab{2};
    for i = 3:L
        newrow{i} = str2num(tab{i});
    end
    oldData = get(handles.uitable,'Data');
    Student_Number = oldData(:,1);
    if sum(strcmp(Student_Number,newrow(1))) == 0
        newData = [oldData;newrow];
        set(handles.uitable,'Data',newData);
        save('newData.mat','newData');
    else 

        prompt = '该学生的信息已存在！';
        title = 'Warning';
        uiwait(warndlg(prompt,title));

    end
end



% --- Executes on button press in Delete_Student.
function Delete_Student_Callback(hObject, eventdata, handles)
% hObject    handle to Delete_Student (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('hangIndex.mat');
newData = get(handles.uitable,'Data');
[R,L] = size(newData);
A = exist('hangIndex');
% fprintf('%d\n',A);
if A ~= 0
  %  hangIndex = handles.hangIndex;
    fprintf('%d\n',hangIndex);
else
    hangIndex = R;
end

if hangIndex <= R
    newData(hangIndex,:) = [];
    set(handles.uitable,'Data',newData);
    save('newData.mat','newData');
else
    prompt = '请选择要删除的信息！';
    title = 'Warning';
    uiwait(warndlg(prompt,title));
end


% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
newData = get(handles.uitable,'Data');
set(handles.uitable,'Data',newData);
save('newData.mat','newData');


% --- Executes on button press in Add_Subject.
function Add_Subject_Callback(hObject, eventdata, handles)
% hObject    handle to Add_Subject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Subject = get(handles.uitable,'ColumnName');
a = size(Subject);
% fprintf('(%d %d)\n',a(2),a(1));
% for i = 1:a(1) 
%     fprintf('%s ',Subject{i});
% end
% fprintf('\n');
prompt = {'科目'};
title = '请输入要添加的科目';
lines = [1,50];
def = {'体育'};
tab = inputdlg(prompt,title,lines,def);
if ~isempty(tab)
    
    Newsubject = tab;
    c = ismember(Subject,Newsubject);
    if sum(c) == 0 
        Subject = [Subject;Newsubject];
        set(handles.uitable,'ColumnName',Subject);
        set(handles.uitable,'ColumnEditable',true);
        Subject_init = Subject;
        save('Subject_init','Subject_init');

        [R L] = size(get(handles.uitable,'Data'));
%         fprintf('%f\n',R);
%         fprintf('%f\n',L);
        a = size(Subject);
        newData = get(handles.uitable,'Data');
        newData(:,L+1:a) = {0};
        set(handles.uitable,'Data',newData);
        save('newData.mat','newData');
    else
        prompt = '该科目已存在！';
        title = 'Warning';
        uiwait(warndlg(prompt,title));
    end
end
    
    



% --- Executes on button press in Del_Subject.
function Del_Subject_Callback(hObject, eventdata, handles)
% hObject    handle to Del_Subject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%lieIndex = handles.lieIndex;
Subject = get(handles.uitable,'ColumnName');
[R,L] = size(Subject);
load('lieIndex.mat')
A = exist('lieIndex');
if A ~= 0
    fprintf('%d\n',lieIndex);
else
    lieIndex = R;
end

if lieIndex <= R
    if lieIndex > 2   
        Subject(lieIndex) = [];
        Subject_init = Subject;
        newData = get(handles.uitable,'Data');
        newData(:,lieIndex ) = [];
        set(handles.uitable,'ColumnName',Subject);
        set(handles.uitable,'Data',newData);
        save('newData.mat','newData');
        save('Subject_init.mat','Subject_init');
    else
        prompt = '该列信息不可被删除！';
        title = 'Warning';
        uiwait(warndlg(prompt,title));
    end
else
    prompt = '请选择要删除的信息！';
    title = 'Warning';
    uiwait(warndlg(prompt,title));
end

% --------------------------------------------------------------------
function Change_User_Callback(hObject, eventdata, handles)
% hObject    handle to Change_User (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'用户名','密码'};
title = '登陆';
lines = [1,35];
def = {'sby','1896'};
tab = inputdlg(prompt,title,lines,def);
if ~isempty(tab)
    User = tab{1};
    Password = tab{2};
    while 1
        if strcmp(User,'sby') && strcmp(Password,'1896')
            set(handles.figure1,'Visible','on');
            load('newData.mat');
            load('Subject_init.mat');
            set(handles.uitable,'Data',newData);
            set(handles.uitable,'ColumnName',Subject_init);
            set(handles.uitable,'ColumnEditable',true);
            set(handles.uipanel1,'Visible','on');
            Size = get(handles.figure1,'Position');
            Size(3) = 254.0000;
            set(handles.figure1,'Position',Size);
            break;
        elseif strcmp(User,'123') && strcmp(Password,'1896')...
                ||(strcmp(User,'gingkg') && strcmp(Password,'1997'))
            set(handles.figure1,'Visible','on');
            load('newData.mat');
            load('Subject_init.mat');
            set(handles.uitable,'Data',newData);
            set(handles.uitable,'ColumnName',Subject_init);
            set(handles.uitable,'ColumnEditable',false);
            set(handles.uipanel1,'Visible','off');
            Size = get(handles.figure1,'Position');
            Size(3) = 254.0000-70;
            set(handles.figure1,'Position',Size);
            break;
        else
           % set(handles.figure1,'Visible','off');
            prompt = '用户名或密码错误！';
            title = 'Warning';
            uiwait(warndlg(prompt,title));  
            prompt = {'用户名','密码'};
            title = '登陆';
            lines = [1,35];
            def = {'sby','1896'};
            tab = inputdlg(prompt,title,lines,def);
            if ~isempty(tab)
                User = tab{1};
                Password = tab{2};
            else
                close(gcf);
            end
        end
    end
end

% --------------------------------------------------------------------
function Quit_Callback(hObject, eventdata, handles)
% hObject    handle to Quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%close(gcf);
button = questdlg('你确定退出学生管理系统吗？','退出','Yes','No','Yes');
if strcmp(button,'Yes')
close(gcf);
end


% --------------------------------------------------------------------
function Inquire_Student_Callback(hObject, eventdata, handles)
% hObject    handle to Inquire_Student (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data = get(handles.uitable,'Data');
prompt = {'请输入要查询的学生的学号'};
title = '查询';
lines = [1,35];
def = {'2015302112'};
tab = inputdlg(prompt,title,lines,def);
c = ismember(Data(:,1),tab);
if ~isempty(tab)
    if sum(c) ~= 0
        Mean =  mean([Data{c,3:end}]);
        Name = Data{c,2};
        Mean = num2str(Mean);
        d = dialog('Position',[300 300 250 150],'name','查询结果');
        txt = uicontrol('Parent',d,...
                       'Style','text',...
                       'Position',[20 80 210 40],...
                       'String',strcat(Name,'的平均成绩是：',Mean,'分'),...
                       'fontsize',12);
        btn = uicontrol('Parent',d,...
                       'Position',[85 20 70 25],...
                       'String','关闭',...
                       'Callback','delete(gcf)');        
    else
        prompt = '该学生不存在！';
        title = 'Warning';
        uiwait(warndlg(prompt,title));
    end
end

% --------------------------------------------------------------------
function Inquire_Sub_Callback(hObject, eventdata, handles)
% hObject    handle to Inquire_Sub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data = get(handles.uitable,'Data');
Subject = get(handles.uitable,'ColumnName');
prompt = {'请输入要查询的科目'};
title = '查询';
lines = [1,35];
def = {'语文'};
tab = inputdlg(prompt,title,lines,def);
c = ismember(Subject(3:end),tab);
if ~isempty(tab)
    if sum(c) ~= 0
        Mean =  mean([Data{:,find(c==1)+2}]);
        Top_Score = max([Data{:,find(c==1)+2}]);
        Lowest_Score = min([Data{:,find(c==1)+2}]);
        Name = tab{1};
        Mean = num2str(Mean);
        Top_Score = num2str(Top_Score);
        Lowest_Score = num2str(Lowest_Score);
        Mean = num2str(Mean);
        Top_Score = num2str(Top_Score);
        Lowest_Score = num2str(Lowest_Score);
        str1 = strcat(Name,'的平均成绩是：',Mean,'分');
        str2 = strcat(Name,'的最高成绩是：',Top_Score,'分');
        str3 = strcat(Name,'的最低成绩是：',Lowest_Score,'分');
        str = {str1;str2;str3};
        d = dialog('Position',[300 300 300 200],'name','查询结果');
        txt = uicontrol('Parent',d,...
                       'Style','text',...
                       'Position',[40 80 230 80],...
                       'String',str,...
                       'fontsize',12);
        btn = uicontrol('Parent',d,...
                       'Position',[115 20 70 25],...
                       'String','关闭',...
                       'Callback','delete(gcf)');   
    else
        prompt = '该科目不存在！';
        title = 'Warning';
        uiwait(warndlg(prompt,title));
    end
end
