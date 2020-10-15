% Task 1: Fit least squares and total least squares lines to data points.

% Clear up
clc;
close all;
clear all;
clearvars;

% Begin by loading data points from linjepunkter.mat
load linjepunkter

N = length(x); % number of data points

% Plot data
plot(x, y, '*'); hold on;
xlabel('x') 
ylabel('y')
title('Line fit')
x_fine = [min(x)-0.05,max(x)+0.05]; % used when plotting the fitted lines

% Fit a line to these data points with least squares
% Here you should write code to obtain the p_ls coefficients (assuming the
% line has the form y = p_ls(1) * x + p_ls(2)).
% p_ls = polyfit(x, y, 1);

p_ls = ls(x, y);
plot(x_fine, p_ls(1) * x_fine + p_ls(2))

% Fit a line to these data points with total least squares.
% Note that the total least squares line has the form 
% ax + by + c = 0, but the plot command requires it to be of the form
% y = kx + m, so make sure to convert appropriately.

p_tls = tls(x, y);
plot(x_fine, p_tls(1) * x_fine + p_tls(2) , 'k--')


% Legend --> show which line corresponds to what (if you need to
% re-position the legend, you can modify rect below)
h=legend('data points', 'least-squares','total-least-squares');
rect = [0.20, 0.65, 0.25, 0.25];
set(h, 'Position', rect)

% After having plotted both lines, it's time to compute errors for the
% respective lines. Specifically, for each line (the least squares and the
% total least squares line), compute the least square error and the total
% least square error. 
% Note that the error is the sum of the individual
% errors for each data point! In total you should get 4 errors. Report these
% in your report, and comment on the results. OBS: Recall the distance formula
% between a point and a line from linear algebra, useful when computing orthogonal
% errors!

% WRITE CODE BELOW TO COMPUTE THE 4 ERRORS

disp('Least Square Fit')
[ls_error, tls_error] = error(x, y, p_ls)

disp('Total Least Square Fit')
[ls_error, tls_error] = error(x, y, p_tls)


function [ls_error, tls_error] = error(x, y, p)
% returns [Least Square error, Total Least Square error]
k = p(1);
m = p(2);
n = size(x,2);

ls_error = 0;
tls_error = 0;

for i = 1:n
    ls_error  = ls_error  + (y(i) - (k*x(i) + m))^2;
    tls_error = tls_error + ((abs(k*x(i) - y(i)+m)) / (sqrt(k^2+1)))^2;
end
end

function p = ls(x, y)
% Least Squares
% minimize distance to line in y direction
% Fit a line y = kx + m to the dataset x,y 

A = [x , ones(size(x,1),1)];
p = A\y;

end

function p = tls(x, y)
% Total Least Squares
% minimize distance from point to line 
% Fit a line ax + by + c = 0 to the dataset x,y 
% convert to y = kx + m  and return k,m

iN = 1/size(x,1);
x2 = x'*x;
y2 = y'*y;
xy = x'*y;

xxs = sum(x)^2;
yys = sum(y)^2;
xys = sum(x) * sum(y);

A = [x2-iN*xxs xy-iN*xys
     xy-iN*xys y2-iN*yys];

[V,~] = eig(A);
a = V(1,1);
b = V(2,1);
c = -iN * (a*sum(x) + b*sum(y));

p = -[a c] ./ b;

end