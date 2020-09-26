u = [6 -2 ; 1 -3]
v = 0.5 * [1 1 ; -1 -1]
w = 0.5 * [-1 1 ; -1 1]

norm(u)
norm(v)
norm(w)

uv = u.*v
uvs = sum(sum(uv))

uw = u.*w
uws = sum(sum(uw))

vw = v.*w
vws = sum(sum(vw))

upi = uvs.*v + uws.*w



% Lecture example
% f = [1 2 3 ; 4 5 6 ; 7 7 7]
% e1 = (1/3) * ones(3,3)
% e2 = (1/sqrt(6)) * [1 1 1 ; 0 0 0 ; -1 -1 -1]
% e3 = (1/sqrt(6)) * [1 0 -1 ; 1 0 -1 ; 1 0 -1]
% 
% fe1=e1.*f
% fe1s = sum(sum(fe1))
% 
% fe2=e2.*f
% fe2s = sum(sum(fe2))
% 
% fe3=e3.*f
% fe3s = sum(sum(fe3))
% 
% fpi = fe1s.*e1 + fe2s.*e2 + fe3s.*e3