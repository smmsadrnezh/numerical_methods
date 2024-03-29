function [polynomial_coeff, error] = ch2_curve_fitting_5(X, Y, mantissa, order,point_to_see, draw)

old = digits;
digits(mantissa);

polynomial_coeff = polyfit(X, Y, order);
error = ch2_calculate_rmse(Y, polyval(polynomial_coeff, X))

if nargin > 4
    Polynomial_value = polyval(polynomial_coeff,point_to_see);
    disp( sprintf( 'The value of the polynomial at %d is:', point_to_see) )
    disp(Polynomial_value)
end

if nargin > 5
    Calc_X = [min(X):0.1:max(X)];
    plot(Calc_X, polyval(polynomial_coeff,Calc_X),'b',X,Y,'or')
end

digits(old);
%write the polynomial
poly2sym(polynomial_coeff)

end
