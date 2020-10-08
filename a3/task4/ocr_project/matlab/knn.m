function y = knn(x, classification_data, classification_labels, k)
% K Nearest Neighbour
n = size(classification_data,2);
neighbour_distances = zeros(1, n);

for i = 1 : n
    xti = classification_data(:,i);
    neighbour_distances(i) = norm(xti - x);
end

[~, indices] = mink(neighbour_distances, k);
k_nearest = classification_labels(indices);

y = mode(k_nearest);
end