% clc
% clear all
% close all
% datadir = '../datasets/short1';
% a = dir(datadir);
% file = 'im1'
% fnamebild = [datadir filesep file '.jpg']
% bild = double(imread(fnamebild));
% imshow(imread(fnamebild),'InitialMagnification','fit')
% 
% S = im2segment2(bild);

function [S] = im2segment(im)

    [m, n] = size(im);
    threshold = 25;
    
    % If value at pixel (x,y) > threshold then change 
    % value to 1 else 0
    image = im >= threshold; 
  
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


