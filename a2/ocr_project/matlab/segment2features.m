% clc
% clear all
% close all
% datadir = '../datasets/short1';
% 
% a = dir(datadir);
% 
% file = 'im2';
% 
% fnamebild = [datadir filesep file '.jpg'];
% fnamefacit = [datadir filesep file '.txt'];
% 
% bild = imread(fnamebild);
% fid = fopen(fnamefacit);
% facit = fgetl(fid);
% fclose(fid);
% figure()
% imshow(bild)
% 
% S = im2segment(bild);
% B = S{randperm(5)};
% B = S{4};
% for i=1 : 5
%     x = segment2features2(S{i})
% end


function features = segment2features(I)

% Sum of pixels
f1PixelSum    = 0; 

% Moment of image
f2Moment      = 0; 

% Nbr of circles or holes in segment
% example : 0,4,6,9 got one and 8 got two
f3Circles     = 0; 

% Difference of pixels in the top and bottom half
% example : 6 and 9 or symmetry of 0,3,8 and 1
f4PixelDiffV  = 0;  

% Difference of pixels in the left and right half 
% example : symmetrical numers as 1,8 and 0 or asymmetry of the others
f5PixelDiffH  = 0; 

% Pixels at border
% example : 7, 5, 2 got more border contact
f6PixelSumB   = 0;



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

f6PixelSumB = f6PixelSumB + nnz(im(1,:));
f6PixelSumB = f6PixelSumB + nnz(im(i,:));
f6PixelSumB = f6PixelSumB + nnz(im(:,1));
f6PixelSumB = f6PixelSumB + nnz(im(:,j));

%figure()
%imagesc(im)

features = [f1PixelSum , f2Moment , f3Circles, f4PixelDiffV, f5PixelDiffH, f6PixelSumB];
% I tried using the image itself as features but it was hard to tell if it was a good idea. 
%im = padImage(im);
%features = im(:);
end

% Adds padding to image and make it 30x30
function im = padImage(im)
[i, j] = size(im);
im = padarray(im,[round((30-i)/2) round((30-j)/2)],0,'both');
im = im(1:30,1:30);

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