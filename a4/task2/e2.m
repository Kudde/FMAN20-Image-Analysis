clc;
clear all;
close all;

load('heart_data')

% 1. Estimate the mean and the standard deviation for the 
% two distributions chamber and background
mean_background = mean(background_values);
mean_chamber    = mean(chamber_values);
std_background  = std(background_values);
std_chamber     = std(chamber_values);


% 2. Construct a graph of the heart image with a data-term consisting
% of the negative log likelihoods for the two classes.
prob_background = -log(normpdf(im, mean_background, std_background));
prob_chamber    = -log(normpdf(im, mean_chamber, std_chamber));


% Solve it via max-flow/min-cut

% Width/Height
[M, N] = size(im);

% Pixels
n = M * N;

% Regularization weight
v = 7;

% Create the sparse matrix A
Neighbors = edges4connected(M, N); 
i = Neighbors(:,1); 
j = Neighbors(:,2); 
A = sparse(i,j,v,n,n);

% Create the sparse matrix T
T = [prob_chamber(:) prob_background(:)];
T = sparse(T);

% Max-flow/min-cut
[E, Theta] = maxflow(A, T);
Theta = reshape(Theta, M, N);
Theta = double(Theta);

imshow(Theta,'InitialMagnification',1000);
imshow(im,'InitialMagnification',1000);