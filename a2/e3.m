clc
clear all
c1 = [0.4003, 0.3985, 0.3998, 0.3997, 0.4015, 0.3995, 0.3991];
c2 = [0.2554, 0.3139, 0.2627, 0.3802, 0.3247, 0.3360, 0.2974];
c3 = [0.5632, 0.7687, 0.0524, 0.7586, 0.4443, 0.5505, 0.6469];


% Nearest Neighbours
train   = [c1(1:4) c2(1:4) c3(1:4)];
label   = [1 1 1 1 2 2 2 2 3 3 3 3];
test    = [c1(5:7) c2(5:7) c3(5:7)];

mdl = fitcknn(train',label);
pred = predict(mdl,test');


% Gaussian distributions
mu      = [0.4, 0.3, 0.5];
sigma   = [0.01, 0.05, 0.2];
c       = [c1 c2 c3];
pdfs    = zeros(3,21);

for i=1:3
    pdfs(i,:) = normpdf(c,mu(i),sigma(i));
end

a1 = pdfs(:,1:7)
a2 = pdfs(:,8:14)
a3 = pdfs(:,15:21)

maxPDF = max(pdfs)

