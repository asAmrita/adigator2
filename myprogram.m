function p = myprogram(x, d)
% FIT -- Given x and d, fit() returns p
% such that norm(V*p-d) = min, where
% V = [1, x, x.^2, ... x.^(m-1)].
y=x.^4;
V=1+y.^2;
p = V\d;