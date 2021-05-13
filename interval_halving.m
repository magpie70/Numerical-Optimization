function [L, middle, i] = interval_halving(f, a, b, epsilon)
i = 0;
while abs(b-a) > epsilon
    x0 = 2*(a+b)/4;
    x1 = a+(b-a)/4;
    x2 = b-(b-a)/4;
    y0 = feval(f,x0);
    y1 = feval(f,x1);
    y2 = feval(f,x2);
    if y2>y0 && y0>y1
        b=x0;  
    elseif y2<y0 && y0<y1
        a=x0;
    elseif y1>y0 && y2>y0
        a = x1;
        b = x2;
    end
    i = i+1;
end
L = [a, b];
middle = x0;
end

