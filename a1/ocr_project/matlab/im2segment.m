% clc
% clear all
% close all
% datadir = '../datasets/short1';
% a = dir(datadir);
% file = 'im1'
% fnamebild = [datadir filesep file '.jpg']
% bild = double(imread(fnamebild));
% %imshow(imread(fnamebild),'InitialMagnification','fit')
% 
% 
% S = im2segment2(bild);
% %imshow(S{1},'InitialMagnification','fit')


function [S] = im2segment2(im)


    [m, n] = size(im);
    threshold = 30; 
    
    % If value at pixel (x,y) > threshold then change 
    % value to 1 else 0
    image = im >= threshold; 
    
    %figure()
    imshow(image,'InitialMagnification','fit')
    image = smooth2(image);
    
    %figure()
    %imshow(image,'InitialMagnification','fit')
    
    
    % Label the image with connectivity 4
    [image_labeled, nbr_of_segments] = bwlabel(image,4);
    
    S = cell(1, nbr_of_segments);
    for i = 1:nbr_of_segments
        % Find segment with label i store coordinates in 
        % two lists (row, col)
        [row, col] = find(image_labeled == i);
        
        % Create empty image
        segment = zeros(m, n);
        
        % Add segment to the empty image
        for j = 1:size(row)
            segment(row(j), col(j)) = 1;
        end
        S{i} = segment;
        
    end
    
    S = getLargestSegments(S,5);
    
    
end

function image = smooth(im)
    [m, n] = size(im);
    image = zeros(m,n);
    for row = 2 : m-1
        for col = 2 : n-1
            surrounding = im(row-1:row+1, col-1:col+1);
            image(row,col) = mode(surrounding, 'all');
        end
        
    end
 

end

function image = smooth2(im)
    [m, n] = size(im);
    image = zeros(m,n);
    for row = 2 : m-1
        for col = 2 : n-1
            S = zeros(1,5);
            S(1) = im(row-1, col);
            S(2) = im(row+1, col);
            S(3) = im(row, col);
            S(4) = im(row, col+1);
            S(5) = im(row, col-1);
            image(row,col) = mode(S, 'all');
        end
        
    end
 

end

function [S] = getLargestSegments(S,n)
    % find the n largest segments
    
    S_large = {};
    
    segment_sizes = zeros(size(S,2),1);
    
    for i = 1:size(S,2)
        segment_sizes(i) = sum(S{i}(:) == 1);
    end
    
    segment_sizes = sort(segment_sizes, 'descend');
    cut_off = segment_sizes(n);
    
    for i = 1:size(S,2)
        s = sum(S{i}(:) == 1);
        
        if (s >= cut_off)
            S_large{end + 1} = S{i};
        end
        
    end
    
    S = S_large;

end


