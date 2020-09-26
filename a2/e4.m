clc
clear all

% probability of error
eps1 = 0.05;
eps2 = 0.5;
eps  = eps2;
p    = 1 - eps;

% probability for image i
pi1  = 0.5;
pi2  = 0.25;
pi3  = 0.25;

% posterior
P1 = pi1 * (p^3) * (eps);
P2 = pi2 * (p)   * (eps^3);
P3 = pi3 * (p^2) * (eps^2);

Pn = P1 + P2 + P3;

P1post = P1/Pn
P2post = P2/Pn
P3post = P3/Pn