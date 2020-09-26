image = imread('e1.png');
image = rgb2gray(image);

noise = (1/4) .* ones(2,2);

image = conv2(image, noise);


sharpen = [0 -1 0 ; -1 4 -1 ; 0 -1 0 ];

image = conv2(image, sharpen);

size(image)
imshow(image)

figure()
f1 = [1 0 ; 0 -1];
i1 = conv2(image, f1);
imshow(i1)

figure()
f2 = [0 1 ,-1 0];
i2 = conv2(image, f2);
imshow(i2)

