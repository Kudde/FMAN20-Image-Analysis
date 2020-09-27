clc
clear all
close all
datadir = '../datasets/short1';

a = dir(datadir);

file = 'im2';

fnamebild = [datadir filesep file '.jpg'];
fnamefacit = [datadir filesep file '.txt'];

bild = imread(fnamebild);
fid = fopen(fnamefacit);
facit = fgetl(fid);
fclose(fid);

S = im2segment(bild);
%B = S{randperm(5)};
B = S{4};
for i=1 : 5
    x = segment2features2(S{i});
end


function features = segment2features2(I)

f1PixelSum   = 0; % Sum of pixels
f2Moment     = 0; % Symmetry of image
f3Circles    = 0; % Nbr of circles
f4PixelDiffV = 0; % Difference of pixels in the top and bottom half 
f5PixelDiffH = 0; % Difference of pixels in the left and right half 
f6Ratio      = 0; % Ratio?



im = chopImage(I);

f1PixelSum  = nnz(im);
f2Moment    = mean(moment(im,3));
f3Circles   = bweuler(im);

[i, j] = size(im);

hi = round(i/2);
pixelSumT = nnz(im(1:hi,:));
pixelSumB = nnz(im(hi+1:i,:));
f4PixelDiffV = pixelSumT - pixelSumB;

hj = round(j/2);
pixelSumL = nnz(im(:,1:hj));
pixelSumR = nnz(im(:,hj+1:j));
f5PixelDiffH = pixelSumL - pixelSumR;

f6Ratio = i/j


figure()
imagesc(im)

features = [f1PixelSum , f2Moment , f3Circles, f4PixelDiffV, f5PixelDiffH, f6Ratio];
end

% Centers the image
function im = chopImage(I)

[rows, cols] = find(I);
minCol = min(cols);
maxCol = max(cols);
minRow = min(rows);
maxRow = max(rows);

im = I(minRow:maxRow, minCol:maxCol);

end