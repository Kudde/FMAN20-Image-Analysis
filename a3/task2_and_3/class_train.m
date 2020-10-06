function classification_data = class_train(X, Y)
% Choose your favorite classification method (e.g. Bayes, 
% Nearest Neighbour, or Support Vector Machine) and implement your own routine for training
% Nearest neighbor       - easy
% Gaussian distributions - medium
% Support vector machine - hard

% Matrix X 361 x 200
% 361 pixels from 19x19 images
% 200 images
% 1 column = 1 image
% 1 row = first pixel in all 200 images

% Matrix Y 200 labels.
%  1 = face
% -1 = non face 

% Note that for the nearest neighbour method, there is
% no actual training phase; instead, the training data is simply 
% stored in classification_data.
classification_data = X;
end

