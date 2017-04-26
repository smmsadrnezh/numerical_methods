﻿function [a, b, error] = ch2_curve_fitting_2(X, Y, mantissa, draw)

get_a_0 = @(x, y) ((sum(y) .* sum((x.^2))) - (sum(x) .* sum((x.*y)) ))./((length(x).*sum((x.^2))) - (sum(x).^2));
get_a_1 = @(x, y) (length(x).*sum((x.*y)) - (sum(x).*sum(y)))./((length(x).*sum((x.^2))) - (sum(x).^2));
func_X = @(x) log(x);
func_curve = @(x, a, b) (a.*(log(x))) + b;

b = get_a_0(func_X(X), Y);
a = get_a_1(func_X(X), Y);
error = ch2_calculate_rmse(Y, func_curve(X, a, b));

if nargin > 3
    Calc_X = [min(X):0.1:max(X)];
    Calc_Y = func_curve(Calc_X, a, b);
    plot(Calc_X, Calc_Y,'b',X,Y,'or')
end

old = digits;
digits(mantissa);

digits(old);

end