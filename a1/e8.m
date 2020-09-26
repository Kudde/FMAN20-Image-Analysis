
clc
clear all
close all

load('assignment1bases.mat');

% Stacks - 2 stacks of images 2 x (19 × 19 × 400)
% 400 test images of faces of size 19 × 19

% Bases contains three sets of bases for three different 
% sub- spaces of dimension four 3 x (19 x 19 x 4)

image1 = stacks{1}(:,:,1);
[upi , r] = project_to_basis(image1, bases{1});



mean_norm_b1_i1 = test_images(stacks{1}, bases{1})
mean_norm_b1_i2 = test_images(stacks{2}, bases{1})

mean_norm_b2_i1 = test_images(stacks{1}, bases{2})
mean_norm_b2_i2 = test_images(stacks{2}, bases{2})

mean_norm_b3_i1 = test_images(stacks{1}, bases{3})
mean_norm_b3_i2 = test_images(stacks{2}, bases{3})

% Plot images

% figure()
% subplot(2,2,1); imshow(mat2gray(stacks{2}(:,:,42)));
% figure()
% subplot(2,2,1); imshow(mat2gray(stacks{2}(:,:,111)));
% figure()
% subplot(2,2,1); imshow(mat2gray(stacks{2}(:,:,179)));

% figure()
% for i=1:4
%     subplot(2,2,i); 
%     imshow(mat2gray(bases{3}(:,:,i)));
% end

% -----------  Functions

% Tests all of the 400 test images in a 
% test set and returns the mean of the error norms.
function mean_norm = test_images(images, base)
    nbr_of_images = size(images, 3);
    error_norms = zeros(nbr_of_images, 1);

    for i = 1 : nbr_of_images
        [upii, ri] = project_to_basis(images(:,:,i), base);
        error_norms(i) = ri;

    end

    mean_norm = mean(error_norms);
end

% Projects an image u onto a basis e = (e1, e2, e3, e4) and 
% returns the projection upi and error norm r, 
% i.e. the norm of the difference r = |u ? upi|.
function [upi, r] = project_to_basis(image, base)
    dimensions = size(base, 3);
    upi = zeros(size(image));
    
    for i = 1 : dimensions
        ei = base(:,:,i);
        xi = scalar(ei, image);
        upi = upi + xi.*ei;
    end
    
    r = norm(abs(image - upi),'fro');
end

% Returns the scalar/dot product 
function s = scalar(a, b)
    ab = a.*b;
    s = sum(sum(ab));
end