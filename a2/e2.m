clc
clear all
close all

f = [ 1 2 2 6 8 9 8 ]
x = 1:7
xi = 1:7

y = interp1(x,f,xi,'linear');

figure(1)
plot(x,f,'o',xi,y)


% w=[1,-1];
% 
% c=conv(f,g)
% figure(1)
% plot(x,c,'o',xi,y)

f2 = []
for i = 0:0.1:7
    y = interpolate2(f, i)
    f2 = [f2 y]
end

x2 = 0:0.1:7;
x2i = 0:0.1:7;
figure(2)
plot(x2,f2,'o',x2i, y)

function y = interpolate(f, x)
    y = 0;
    [m, n] = size(f);
    
    for i = 1:n
        y = y + g(x-i) * f(i);

    end


end

function y = interpolate2(f, x)
    y = 0;
    [m, n] = size(f);
    
    for i = 1:n
        y = y + g2(x-i) * f(i);

    end


end

function y = g(x)
    y = 0;
    if abs(x) < 1
        y = 1 - abs(x);
    end
end

function y = g2(x)
    
    if abs(x) <= 1
        y = abs(x)^3 - 2 * abs(x)^2 + 1;
        
    elseif 1 < abs(x) && abs(x) <= 2
        y = -abs(x)^3 - 5 * abs(x)^2 - 8 * abs(x) + 4;
        
    else
        y = 0;
    end
end















