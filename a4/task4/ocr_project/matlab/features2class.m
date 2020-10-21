

% Construct a classifier that takes a feature vector x and calculates a class y
% The function takes a feature vector x as input and returns a number y as output. 
% Here y is an integer between 1 and 10. [ 0 1 2 3 4 5 6 7 8 9 ]
% (The numbers are coded from 1 to 10, where 1 corresponds to ?0?
% , 2 corresponds to ?1? and so forth.)
function y = features2class(x, classification_data)

K = 1;
X = classification_data{1};
Y = classification_data{2};

y = knn(x, X, Y, K);


end