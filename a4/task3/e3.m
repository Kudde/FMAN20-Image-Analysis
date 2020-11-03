clc;
clear all;
close all;

% Camera matrices
P1 = [ 1 0 0 0
       0 1 0 0
       0 0 1 0 ]
   
P2 = [ 2 4 3  3
       1 2 0 -2
       1 1 3  0 ]
   
% Fundamental matrix
F = [ 2   2  6
      3   3  9
     -7 -14 -6];
 
% Points in image 1
a1 = [ 0; -2];
a2 = [ 2;  1];
a3 = [-4; -3];
a = [a1 a2 a3; ones(1,3)]


% Points in image 2
b1 = [-8; -2];
b2 = [ 1;  3];
b3 = [ 5;  2];
b = [b1 b2 b3; ones(1,3)]


% Possible Correspondances

% a to epipolar line b
cB = a'*F*b

% b to epipolar line a
cA = b'*F*a

