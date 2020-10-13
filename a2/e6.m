clc
clear all

% images
B = [1 1 0;
     1 0 1;
     1 1 0;
     1 0 1;
     1 1 0];
 
O = [0 1 0;
     1 0 1;
     1 0 1;
     1 0 1;
     0 1 0];
 
E = [0 1 0;
     1 0 1;
     0 1 0;
     1 0 1;
     0 1 0];

x = [0 0 0;
     1 0 0;
     0 1 0;
     0 0 1;
     1 1 0];
 
% probabbility of characters
pB = 0.25;
pO = 0.40;
pE = 0.35;

% errors
epsW = 0.35; % probability of white being black 
epsB = 0.25; % probability of black being white 

pCW  = 1-epsW; % probability of white being white
pCB  = 1-epsB; % probability of black being black

 
% posterior = 
% * prob for image i 
% * pCW^(nbr of correct black pixels) 
% * pCB^(nbr of correct white pixels) 
% * epsW^(nbr of incorrect black pixels)
% * epsB^(nbr of incorrect white pixels)
% / Pn

PB = pB * (pCB^5) * (pCW^5) * (epsB^5) * (epsW^0);
PO = pO * (pCB^3) * (pCW^5) * (epsB^5) * (epsW^2);
PE = pE * (pCB^4) * (pCW^7) * (epsB^3) * (epsW^1);

Pn = PB + PO + PE;

PBpost = PB/Pn
POpost = PO/Pn
PEpost = PE/Pn















