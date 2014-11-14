function varargout = gauss_quad_gui(varargin)
% GAUSS_QUAD_GUI MATLAB code for gauss_quad_gui.fig
%      GAUSS_QUAD_GUI, by itself, creates a new GAUSS_QUAD_GUI or raises the existing
%      singleton*.
%
%      H = GAUSS_QUAD_GUI returns the handle to a new GAUSS_QUAD_GUI or the handle to
%      the existing singleton*.
%
%      GAUSS_QUAD_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAUSS_QUAD_GUI.M with the given input arguments.
%
%      GAUSS_QUAD_GUI('Property','Value',...) creates a new GAUSS_QUAD_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gauss_quad_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gauss_quad_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gauss_quad_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gauss_quad_gui_OutputFcn, ...
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


% --- Executes just before gauss_quad_gui is made visible.
function gauss_quad_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gauss_quad_gui (see VARARGIN)

% Choose default command line output for gauss_quad_gui
handles.output = hObject;

% Axis settings (prevent strange background colors)
cla(handles.plot_integrand);
cla(handles.plot_quadrature);
cla(handles.plot_weights);

set(handles.plot_integrand,'Color',[1, 1, 1]);
set(handles.plot_quadrature,'Color',[1, 1, 1]);
set(handles.plot_weights,'Color',[1, 1, 1]);

% Populate with interesting data
ud = get(handles.settings,'UserData');
% Which radio button should be selected by default?
set(handles.settings,'SelectedObject',handles.hermite);
% Which radio button is selected? This determines the quadrature type.
ud.qt = get(get(handles.settings,'SelectedObject'),'Tag');
ud.lower = -1;
ud.upper = 1;
ud.valid=true;
set(handles.settings,'UserData',ud); % update the UserData for settings

% Initialise the UserData
readUserInput(handles);
% Set up the plots
refreshAll(handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gauss_quad_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gauss_quad_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function funct_entry_Callback(hObject, eventdata, handles)
% hObject    handle to funct_entry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funct_entry as text
%        str2double(get(hObject,'String')) returns contents of funct_entry as a double
readUserInput(handles);
refreshAll(handles);





% --- Executes during object creation, after setting all properties.
function funct_entry_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funct_entry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lower_limit_Callback(hObject, eventdata, handles)
% hObject    handle to lower_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lower_limit as text
%        str2double(get(hObject,'String')) returns contents of lower_limit as a double
readUserInput(handles);
refreshAll(handles);

% --- Executes during object creation, after setting all properties.
function lower_limit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lower_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function upper_limit_Callback(hObject, eventdata, handles)
% hObject    handle to upper_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of upper_limit as text
%        str2double(get(hObject,'String')) returns contents of upper_limit as a double
readUserInput(handles);
refreshAll(handles);


% --- Executes during object creation, after setting all properties.
function upper_limit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to upper_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in function_select.
function function_select_Callback(hObject, eventdata, handles)
% hObject    handle to function_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns function_select contents as cell array
%        contents{get(hObject,'Value')} returns selected item from function_select


% --- Executes during object creation, after setting all properties.
function function_select_CreateFcn(hObject, eventdata, handles)
% hObject    handle to function_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function node_count_Callback(hObject, eventdata, handles)
% hObject    handle to node_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of node_count as text
%        str2double(get(hObject,'String')) returns contents of node_count as a double


% --- Executes during object creation, after setting all properties.
function node_count_CreateFcn(hObject, eventdata, handles)
% hObject    handle to node_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when selected object is changed in settings.
function settings_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in settings 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

label=get(eventdata.NewValue,'tag'); % see which radio button is now active

% get UserData (need to save and update at the end)
ud = get(handles.settings,'UserData');

% record the quadrature type
ud.qt = label;

set(handles.settings,'UserData',ud); % update the UserData for settings

readUserInput(handles);
refreshAll(handles);
%cla(handles.plot_quadrature);

guidata(hObject,handles);

function [ w ] = get_weight_function( family )
% Return a function handle w for the weight function of the family
    switch(family)
        case 'legendre'
            w=@(x)(1);
        case 'chebyshev'
            w=@(x)(1./sqrt(1-x.^2));
        case 'laguerre'
            w=@(x)(exp(-x));
        case 'hermite'
            w=@(x)(exp(-x.^2)); % weight function exp(-x.^2) on the real line
    end
    
function updatePlot_integrand(handles)
ud = get(handles.settings,'UserData');

if ud.valid
    % Update the plot of the integrand - ie w(x)f(x)
    cla(handles.plot_integrand);
    f = ud.f;
    w = ud.weightfcn;
    a=ud.lower;
    b=ud.upper;

    integrand=@(x)(w(x).*f(x));
    fplot(handles.plot_integrand,integrand,[a,b]);
end


function updatePlot_weights(handles)
ud = get(handles.settings,'UserData');    
    
if ud.valid
    % Update the plot of weights vs nodes
    a=ud.lower;
    b=ud.upper;

    stem(handles.plot_weights,ud.nodes,ud.weights);
    set(gca,'XLim',[a b]);
end
    
function updatePlot_quadrature(handles)
ud = get(handles.settings,'UserData');

if ud.valid
    % Update the plot of quadrature vs number of nodes

    f = ud.f;
    f = @(x)(f(x));

    minn=ud.minn;
    maxn=ud.maxn;
    q=zeros(1,maxn-minn+1);
    a=ud.lower;
    b=ud.upper;

    quad = ud.qt;

    if( strcmp(quad,'cnc') || strcmp(quad,'onc') )
        for i = minn:maxn
             [nodes,weights]=ncQuad(i,quad,a,b);
             q(i-minn+1)=sum(weights.*arrayfun(f,nodes));
        end
    else
        for i = minn:maxn
            [nodes,weights]=gaussQuad(i,quad);
            q(i-minn+1)=sum(weights.*arrayfun(f,nodes));
        end
    end

    plot(handles.plot_quadrature,minn:maxn,q);
    set(handles.plot_quadrature,'XLim',[minn maxn]);
end

function readUserInput(handles)
% Reads user input and feeds it into settings UserData

% Note: only the user-input common to all

% get UserData (need to save and update at the end)
ud = get(handles.settings,'UserData');
qt = ud.qt; % set in settings_SelectionChangeFcn

ud.valid=false;

switch(qt)
    case 'cnc'        
        % set their contents to the appropriate default values
        set(handles.lower_limit,'String','-1');
        set(handles.upper_limit,'String','1');
        
        ud.lower=-1;
        ud.upper=1;
    case 'onc'        
        % set their contents to the appropriate default values
        set(handles.lower_limit,'String','-1');
        set(handles.upper_limit,'String','1');
        
        ud.lower=-1;
        ud.upper=1;
        
        % set the weight function, nodes, etc
    case 'legendre'

        % set their contents to the appropriate values for Legendre
        set(handles.lower_limit,'String','-1');
        set(handles.upper_limit,'String','1');
        
        ud.lower=-1;
        ud.upper=1;

    case 'chebyshev'
       
        % set their contents to the appropriate values for Chebyshev
        set(handles.lower_limit,'String','-1');
        set(handles.upper_limit,'String','1');
        
        ud.lower=-1;
        ud.upper=1;

    case 'laguerre'
       
        % set their contents to the appropriate values for Laguerre
        set(handles.lower_limit,'String','0');
        set(handles.upper_limit,'String','inf');
    case 'hermite'
        
        % set their contents to the appropriate values for Laguerre
        set(handles.lower_limit,'String','-inf');
        set(handles.upper_limit,'String','inf');
end

try
    % Get and check the current node count value
    n=str2double(get(handles.nnodes,'String'));
    
    assert( ~isnan(n) && isreal(n) && ~isinf(n) && ceil(n) == n && ...
        n > 0, 'Number of nodes must be a positive integer!');
    
    ud.n=n;
    
    % Get and check the min anx max node count values

    minn = str2double(get(handles.min_nnodes,'String'));
    maxn = str2double(get(handles.max_nnodes,'String'));

    assert( ~or(isnan(minn),isnan(maxn)) && ...
        and(isreal(minn),isreal(maxn)) && ...
        ~or(isinf(minn),isinf(maxn)) && ...
        and(floor(minn)==minn,floor(maxn)==maxn) && ...
        and(minn >= 2,minn < maxn) && maxn <=50,...
        ['Invalid node count range. ',...
        'At least 2 (and no more than 50) nodes required.']);
    
    ud.minn=minn;
    ud.maxn=maxn;
        
        
    % Get and check the function f
    try
        f = inline(get(handles.funct_entry,'string'),'x');
        x = sym('x');
        feval(f,x);
    catch err
        m=err.message;
        m=[m ' (Please re-enter f)'];
        rethrow(struct('message',m));
    end
    
    ud.f=f;
        
        
    % Get the weight function for the selected quadrature type
    if( ~( strcmp(qt,'onc') || strcmp(qt,'cnc') ) )
        ud.weightfcn = get_weight_function( qt );
        [ud.nodes,ud.weights]=gaussQuad(n,qt);
    else
        ud.weightfcn = @(x)(1);
        [ud.nodes,ud.weights]=ncQuad(n,qt,ud.lower,ud.upper);
    end

    % need to handle limits in these cases separately
    if( strcmp(qt,'laguerre') || strcmp(qt,'hermite') )
        ud.lower=ud.nodes(1);
        ud.upper=ud.nodes(length(ud.nodes));
    end
    ud.valid=true;
catch err
    h=msgbox(err.message,'Error','error','modal');
    waitfor(h);
    ud.valid=false;
end
    
set(handles.settings,'UserData',ud); % update the UserData for settings

function refreshAll(handles)
updatePlot_integrand(handles);
updatePlot_weights(handles);
updatePlot_quadrature(handles);


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to lower_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lower_limit as text
%        str2double(get(hObject,'String')) returns contents of lower_limit as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lower_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to upper_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of upper_limit as text
%        str2double(get(hObject,'String')) returns contents of upper_limit as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to upper_limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nnodes_Callback(hObject, eventdata, handles)
% hObject    handle to nnodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nnodes as text
%        str2double(get(hObject,'String')) returns contents of nnodes as a double

readUserInput(handles);
refreshAll(handles);


% --- Executes during object creation, after setting all properties.
function nnodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nnodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in get_quadrature.
function get_quadrature_Callback(hObject, eventdata, handles)
% hObject    handle to get_quadrature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

readUserInput(handles);
refreshAll(handles);




function min_nnodes_Callback(hObject, eventdata, handles)
% hObject    handle to min_nnodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_nnodes as text
%        str2double(get(hObject,'String')) returns contents of min_nnodes as a double

%Check if min_nnodes is a positive integer
readUserInput(handles);
refreshAll(handles);


% --- Executes during object creation, after setting all properties.
function min_nnodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_nnodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_nnodes_Callback(hObject, eventdata, handles)
% hObject    handle to max_nnodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_nnodes as text
%        str2double(get(hObject,'String')) returns contents of max_nnodes as a double
readUserInput(handles);
refreshAll(handles);


% --- Executes during object creation, after setting all properties.
function max_nnodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_nnodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in get_quadrature.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to get_quadrature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to max_nnodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_nnodes as text
%        str2double(get(hObject,'String')) returns contents of max_nnodes as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_nnodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function preset_fcns_CreateFcn(hObject, eventdata, handles)
% hObject    handle to preset_fcns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in preset_fcns.
function preset_fcns_Callback(hObject, eventdata, handles)
% hObject    handle to preset_fcns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns preset_fcns contents as cell array
%        contents{get(hObject,'Value')} returns selected item from preset_fcns

index = get(hObject,'Value');
contents = cellstr(get(hObject,'String'));
if( index > 1 )
    set(handles.funct_entry,'String',contents{index});
end
readUserInput(handles);
refreshAll(handles);
%cla(handles.plot_quadrature);

function [ nodes, weights ] = gaussQuad( nnodes, family )
%gaussQuad: Gaussian quadrature nodes and weights
%   Input arguments:
%       nnodes = number of nodes
%       family =  family of orthogonal polynomials. 
%           Equal to '<family>' where <family> is one of:
%               legendre
%               chebyshev
%               laguerre
%               hermite
%           (See also ./TTRRcoeff.m)
%   Output arguments:
%       nodes = interpolation nodes
%       weights = interpolation weights
%
%   (So that the quadrature can be found eg by 
%       sum(weights.*f(nodes));
%   for a function handle f)
%
%
%   IMPLEMENTATION DETAILS
%       The Golub-Welsch method. See [1], pp 141-145.
%
%   REFERENCES
%   [1] Numerical Methods for Special Functions; Amparo Gil, Javier Segura;
%   Nico M. Temme; SIAM 2007

    n=nnodes; % for brevity

    % mu0 = integral of weight function over relevant interval
    switch(family)
        case 'legendre'
            mu0=2; % weight function 1 on [-1,1]
        case 'chebyshev'
            mu0=pi; % weight function 1./sqrt(1-x.^2) on [-1,1]
        case 'laguerre'
            mu0=1; % weight function exp(-x) on [0,infinity)
        case 'hermite'
            mu0=sqrt(2.*pi); % weight function exp(-x.^2) on the real line
    end

    % Get the coefficients for the Three-Term Recurrence Relation
    [a,b,c]=TTRRcoeff(nnodes,family);

    % Form the Jacobian matrix; see [1] p 144 (5.100)
    offdiag = sqrt(a(1:(n-1)).*c(2:n)); % off-diagonal elements
    subdiag = [offdiag 0]; % 0-padding required for correct alignment
    supdiag = [0 offdiag]; % 0-padding required for correct alignment

    % Following 3 commands generate the TST (=> sparse!) Jacobian matrix
    B = [subdiag' b' supdiag'];
    d = [-1 0 1];
    J = spdiags(B,d,n,n);

    % Find the eigenvalues and eigenvectors
    [V,D]=eig(full(J)); 
    % replace with [V,D]=eigs(J) for *very* large n

    nodes=diag(D)'; % nodes = eigenvalues, ie the diagonal elements.

    % Calculate the weights; see [1] p 143 (5.93)
    weights=zeros(1,n);
    for i=1:n
        weights(i)=mu0.*(V(1,i)./norm(V(:,i))).^2;
    end

    function [ nodes, weights ] = ncQuad( nnodes, family, a, b )
%ncQuad Newton-Cotes quadrature nodes and weights
%   Input arguments
%       nnodes = number of nodes
%       family = type of quadrature rule
%           Equal to one of
%               'cnc' = closed Newton-Cotes rule (endpoints!)
%               'onc' = open Newton-Cotes rule (no endpoints!)
%       a = lower endpoint of integration interval
%       b = upper endpoint of integration interval
%   
%   Output arguments
%       nodes = the quadrature nodes
%       weights = the corresponding weights
%       
%   The quadrature of f can be calculated by eg sum(weights.*f(nodes))
    if( ~(a < b) )
        fprintf('ERROR: lower endpoint of interval must not be greater than upper endpoint!\n');
        nodes = NaN;
        weights = NaN;
        return;
    end
    
    n=nnodes; % for brevity
    
    % define the nodes
    switch(family)
        case 'cnc'
            nodes = linspace(a,b,n);
        case 'onc'
            nodes = linspace(a,b,n+2);
            nodes = nodes(2:n+1);
        otherwise
            fprintf('ERROR: Invalid family!\n');  
            nodes = NaN;
            weights = NaN;
            return;
    end

    weights=zeros(1,n);
    % The weights are the integrals of the Lagrange cardinal polynomials
    for i=1:n
        max_index=n-1;
        v=0:max_index;
        v(i)=[];
        L=poly(v);
        Q=polyint(L,0);
        w=polyval(Q,max_index);
        
        % Computationally stable and efficient (I hope) method for
        %                 n-i
        %         w*h*(-1)
        %       --------------
        %        (i-1)! (n-i)!
        % Where h = (b-a)/(n-1)
        
        p = n - i;
        q = i - 1;
        
        if bitget(p,1) == 1 % even or odd?
            s = -1; % odd
        else
            s = 1; % even
        end
        % divide up the operations...
        w = w.*(b-a); % multiplication first
        % then the divisions...
        for k=2:q
            w=w./k;
        end
        for k=2:p
            w=w./k;
        end
        w=w./max_index;
        % finally handle the sign
        w=w.*s;
        weights(i)=w;
    end
    
    function [ a, b, c ] = TTRRcoeff( n, family )
%TTRRcoeff Calculates Three Term Recurrence Relation coefficients
%   Input arguments
%       n = number of coefficents to calculate (so max. index is n-1)
%       family =  family of orthogonal polynomials. 
%           Equal to '<family>' where <family> is one of:
%               legendre
%               chebyshev
%               laguerre
%               hermite
%   Output arguments
%       a, b, c = TTRR coefficients, see [1] section 5.3 pp 139-141
%
%   REFERENCES
%   [1] Numerical Methods for Special Functions; Amparo Gil, Javier Segura;
%   Nico M. Temme; SIAM 2007

a = zeros(1,n);
b = a;
c = a;

    switch(family)
        case 'legendre'
            i=0:(n-1);
            a=(i+1)./(2*i+1);
            c=i./(2.*i+1);
        case 'chebyshev'
            a(1)=2;
            i=1:(n-1);
            a(2:n)=(i+1)./(2.*i+1);
            c(1)=0;
            i=1:(n-1);
            c(2:n)=(2.*i-1)./(4.*i);
        case 'laguerre'
            i=0:(n-1);
            a=-(i+1);
            b=2.*i+1;
            c=-i;
        case 'hermite'
            a=0.5*ones(1,n);
            c=0:(n-1);
    end
