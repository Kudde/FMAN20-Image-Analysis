clc
clear all

% probability of error
eps = 0.2;
p   = 1 - eps;
diff = p;

% create image
image = [1 0 0 0;
         0 1 0 0;
         0 0 1 0;
         0 1 0 0];

% probability of line in column i
pc1  = 0.3;
pc2  = 0.2;
pc3  = 0.2;
pc4  = 0.3;

% posterior = 
% * prob for column i 
% * p^(nbr of correct pixels) 
% * eps^(nbr of incorrect pixels) in image
% / Pn
P1 = pc1 * (p^10) * (eps^6);
P2 = pc2 * (p^12) * (eps^4);
P3 = pc3 * (p^10) * (eps^6);
P4 = pc4 * (p^8)  * (eps^8);
Pn = P1 + P2 + P3 + P4;

P1post = P1/Pn
P2post = P2/Pn
P3post = P3/Pn
P4post = P4/Pn


