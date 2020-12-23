%% MAIN DRIVER FILE

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Matlab environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Command Window: you can write and execute Matlab commands to perform any
% programming tasks.

% Workspace: it displays Matlab variables created by Matlab commands.

% Current Folder: a browser to access your files directly from within the
% Matlab desktop.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Matlab basic commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Assign objects to the workspace, semicolon suppresses outputs
var1 = 40;
var2 = 2.34
var3 = 1/2;

% Save variables to a .mat file
save('test1.mat','var1');

% Clear only a specific object from the memory
clear var1
% Clear all objects from the memory
clear
% Clear the command window
clc

% Load variables from a .mat file
load('test1.mat');

clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Matlab editor and shortcuts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Editor: a text editor to write or modify any files, mainly scripts and
% functions.

% Script: it contains a sequence of command lines. When typing the name of 
% the script in the command window, all of the commands are executed and 
% the new information is available to your workspace.

% Function: it takes in arguments and is a 'new' workspace, separate from
% the main workspace. You can run the same function over and over with 
% different values.

% Some useful shortcuts when using the Matlab editor are:
% F5 runs the entire program
% F9 runs the highlighted code
% Ctrl + N creates a blank script
% Ctrl + R comments highlighted code
% Ctrl + T uncomments highlighted code

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Matrix manipulation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialization of variables
w = 6:2:20;
x = [1, 2, 3];
y = [4; 5; 6];
z1 = [7, 8; 9, 10];
z2 = [2, 1; -3, 0.5];
identity = eye(3); % identity matrix
w1 = ones(2,3); % matrix of 1 values
w2 = zeros(3,2); % matrix of 0 values
w3 = linspace(0, 10, 50); %linearly spaced points

% Matrix indexing
x = [1,3,4; 8,12,9; -5,20,0];
x(1,3)
x(1,:)
x(:,1)
x(2:3,:)
x(1,2:end)
find(x >= 2) % list indices of elements of a condition
x(x >= 2) % list elements of a condition
x(x == 20) = 21; % assign a value for a specific condition

size(w1) % returns dimensions of the matrix (rows and columns)
size(w1,1) % returns number of rows
size(w1,2) % returns number of columns

% Matrix operations
z1 + z2 % matrix addition
z1 - z2 % matrix substraction
inv(z1) % matrix inverse
z1 * z2 % matrix multiplication
z1 .* z2 % element-wise multiplication
z1 / z2 % matrix 'division', equivalent to z1 * inv(z2)
z1 ./ z2 % element-wise division
z2 ^ 2 % matrix power
z2 .^ 2 % element-wise power

% Matrix transformations
reshape(w, [2,4]) % reshapes a matrix into a 2-by-4 matrix
reshape(w, 4, []) % reshapes a matrix into a matrix with 4 rows
reshape(w, [], 4) % reshapes a matrix into a matrix with 4 columns
[x', y] % concatenates horizontally
[x; y'] % concatenates vertically
repmat(y, 3, 5) % copies the matrix

clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Other data structures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cell arrays
C = {[1,2,3],'hello',{1};[3;5],'yes',{'no'}}; % cell array
C{1,1}
C{1,:}
C{:,1}

% Tables, structure arrays
load patients
T = table(Gender,Smoker,Height,Weight);
T(T.Smoker == true,:)
T(1:10, {'Height','Weight'})
summary(T)

% You can import data in many format (e.g. xlsx, csv, etc.). For more
% information, see Matlab documentation:
% https://www.mathworks.com/help/matlab/import_export/ways-to-import-spreadsheets.html

clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Standard functions and operators
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Distributions (e.g. norm, t, f, gam, logn, chi2, bino, exp, ...)
normpdf(0) % probability density function
normcdf(1.645) % cumulative distribution function
norminv(0.975) % inverse cumulative distribution function
normrnd(1, 3, 2, 4) % random numbers in a matrix

% Standard functions (e.g. sum, cumsum, sqrt, log, max, round, ...)
rng(1234) % controls random number generation
x = unifrnd(-10, 20, 2, 4, 3);
sum(x,1) % sums along 1st dimension, equivalent to sum(x)
sum(x,2) % sums along the 2nd dimension
sum(x,3) % sums along the 3rd dimension
[maximum, index] = max(x,[],1) % finds maximum along 1st dimension, equivalent to max(x)
[maximum, index] = max(x,[],2) % finds maximum along 2nd dimension
[maximum, index] = max(x,[],3) % finds maximum along 3rd dimension

% Matrix indexing for 3+ dimensions works as the 2-dimension case
x(1,[1,3,4],2:3)
squeeze(x(1,[1,3,4],2:3)) % removes dimensions of length 1

clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Loops and conditionals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% if/elseif/else statement (test multiple conditions)
criterion1 = 1;
criterion2 = 0;
if(criterion1)
	fprintf('Criterion 1 is true.\n');
elseif(criterion2)
	fprintf('Criterion 2 is true.\n');
else
	fprintf('Criteria 1 and 2 are false.\n');
end

% switch statement (test multiple conditions)
Number = -0.1234;
switch Number
    case 1
        fprintf('The number is 1. \n');
    case -0.1234
        fprintf('The number is -0.1234. \n');
    case 2.2
        fprintf('The number is 2.2. \n');
    otherwise
        fprintf('The number is not in the cases. \n');
end

% for loop (stop after a number of iterations)
for ii=3:7
	fprintf('This is the iteration %.d \n', ii);
end

% while loop (stop after a certain condition)
idx = 0;
while(idx < 3)
    idx = idx + unifrnd(0,1);
	fprintf('The random number is now %.4f \n', idx);
end

% Ctrl + C stops the execution of the program, in case you are stuck in an
% infinite loop! ;-)

clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plotting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = linspace(-1,10,100);
y1 = exp(x);
y2 = sin(x);
y3 = cos(x);
d = -2*pi:0.1:2*pi;
[dX, dY] = meshgrid(d,d);
dZ = exp(cos(sqrt(dX.^2 + dY.^2)));

% Initialize the figure
figure()

% Subplot 1
subplot(1,3,1);
plot(x, y1);

% Subplot 2
subplot(1,3,2);
plot(x, y2, '-b');
hold on;
p3 = plot(x, y3);
hold off;

% Add labels, titles and a legend
xlabel('Axis X');
ylabel('Axis Y');
title('Title of the 2nd subplot');
sgtitle('Overall title');
legend({'sin(x)','cos(x)'}, 'location', 'northeast', 'fontsize', 16)

% Change attributes of plot object
set(p3, ... % curve p3
    'linewidth', 0.75, ... % modify line width
    'linestyle', '-.', ... % modify line style
    'marker', '*', ... % modify marker
    'markersize', 9, ... % modify marker size
    'color', 'red') % modify the color
set(gca, ... % plot
    'fontsize', 16, ... % modify font size
    'ylim', [-2,3]) % modify y-axis limits

% Subplot 3
subplot(1,3,3);
contourf(dX, dY, dZ);
colorbar('location', 'southoutside');

clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Function files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialize parameters
Ndt = 2^10; % number of time steps
Nsims = 10000; % number of simulations
drift = 0.1; % drift, mean return
vol = 0.2; % volatility, standard deviation of returns
terminal = 1; % terminal time
init_price = 10; % initial price

% Call the function
help GBM1
[time1, price] =  GBM1(init_price, drift, vol, terminal, Ndt, Nsims);

% Plot stock price simulations
figure()
p1 = plot(time1, price(:,1:10), '-', 'linewidth', 0.05);
hold on;
p2 = plot(time1, quantile(price,[0.1,0.5,0.9],2), '-k', 'linewidth', 1.5);
title('Simulations of a Geometric Brownian Motion');
xlabel('Time');
ylabel('Value');
set(gca, 'fontsize', 16);

clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Debug mode
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The Matlab debugger allows you to pause the code execution and examine
% variables. It helps locate and correct typos or mistakes in your
% programs.

% 1. Click on the dash (-) at the left of a line to set a breakpoint.
% 2. Run the Matlab program.
% 3. Once the program is stopped, you can examine variables and step
% through the file by executing each line one at the time.

% Description -- Toolbar Button -- Function Alternative
% Execute the current line -- Step -- dbstep
% Execute the current line and step in the function -- Step In -- dbstep in
% Execute until the next breakpoint -- Continue -- dbcont
% Exit debug mode -- Quit Debugging -- dbquit

% For more information, see Matlab documentation:
% https://www.mathworks.com/help/matlab/matlab_prog/debugging-process-and-features.html