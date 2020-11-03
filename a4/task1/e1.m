% Segment honey combs
clc;
clear all;
close all;
image = imread('honeycomb.jpg');
im = rgb2gray(image);
figure();
imshow(im)

[m, n] = size(im);

threshold = 145;
    
% If value at pixel (x,y) > threshold then change 
% value to 1 else 0
seg_im = im <= threshold; 

figure();
imshow(seg_im)

BW2 = imfill(seg_im,'holes');

figure();
imshow(BW2)

[image_labeled, nbr_of_segments] = bwlabel(BW2,8);