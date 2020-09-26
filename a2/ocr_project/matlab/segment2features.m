clc
clear all
close all
datadir = '../datasets/short1';

a = dir(datadir);

file = 'im1';

fnamebild = [datadir filesep file '.jpg'];
fnamefacit = [datadir filesep file '.txt'];

bild = imread(fnamebild);
fid = fopen(fnamefacit);
facit = fgetl(fid);
fclose(fid);

S = im2segment(bild);
B = S{1};
x = segment2features2(B);

% try using :
% moments, 
% histograms, 
% the sum of the pixel values along a row or in a subregion

function features = segment2features2(I)

end