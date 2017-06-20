function [ finalY, Y ] = ch5_runge_kuttah_4th_order( f, x0, y0, h, n )
    h =  h / n;
    X = x0 + [0:n] * h;
    Y = zeros(size(X));
    Y(1) = y0;
    
    for i = 1:n
        Y(i+1) = ch5_runge_kuttah_4th_order_one_step(f,X(i),Y(i),h);
    end
    finalY = Y(n+1);
end

function [ Y ] = ch5_runge_kuttah_4th_order_one_step( f, x0, y0, h )
    k1 = h * ch5_f( f, x0 , y0 ) ;
    k2 = h * ch5_f( f, x0+h/2 , y0+k1/2 ) ;
    k3 = h * ch5_f( f, x0+h/2 , y0+k2/2 ) ;
    k4 = h * ch5_f( f, x0+h , y0+k3 ) ;
    Y = y0 + (k1 + 2*k2 + 2*k3 + k4)/6;
end