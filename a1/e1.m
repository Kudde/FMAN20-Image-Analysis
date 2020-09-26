image = zeros(5)
x = 0:0.25:1
y = 0:0.25:1

for col = 1:5
    for row = 1:5
        image(col,row) = x(col) * (1 - y(row)) + y(row) * (1 - x(col));
        
    end
end

image
image_quant = round(image.*15)
image_gray = mat2gray(image_quant)
imshow(flipud(image_gray),'InitialMagnification','fit')