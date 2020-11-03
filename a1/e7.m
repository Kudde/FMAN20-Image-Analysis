o1 = (1/3) * [0 1 0 ; 1 1 1 ; 1 0 1 ; 1 1 1]
o2 = (1/3) * [1 1 1 ; 1 0 1 ; -1 -1 -1 ; 0 -1 0]
o3 = (1/2) * [1 0 -1 ; 1 0 -1 ; 0 0 0 ; 0 0 0]
o4 = (1/2) * [0 0 0 ; 0 0 0 ; 1 0 -1 ; 1 0 -1]

f = [-2 6 3 ; 13 7 5 ; 7 1 8 ; -3 3 4]

o1o2 = scalar(o1, o2)
o1o3 = scalar(o1, o3)
o1o4 = scalar(o1, o4)
o2o3 = scalar(o2, o3)
o2o4 = scalar(o2, o4)
o3o4 = scalar(o3, o4)

x1 = scalar(o1, f)
x2 = scalar(o2, f)
x3 = scalar(o3, f)
x4 = scalar(o4, f)


fa = x1.*o1 + x2.*o2 + x3.*o3 + x4.*o4

fdiff  = f - fa
error  = scalar((f - fa),(f - fa))
normF  = norm(f)
normFa = norm(fa)
normFdiff = norm(fdiff)


function s = scalar(a, b)
    ab = a.*b;
    s = sum(sum(ab));
end

