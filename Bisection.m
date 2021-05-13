function  [m i table] = Bisection(f, low, high, tol)
i = 0; 
table = [];
% Evaluate both ends of the interval
y1 = feval(f, low);
y2 = feval(f, high);
while (abs(high - low) >= tol || feval(f, m) <= 0)
    i = i + 1;
    m = (high + low)/2;
    y3 = feval(f, m);
    table = [table; i, low, high, m, feval(f, m)];
    if y1 * y3 > 0
        low = m;
        y1 = y3;
    else
        high = m;
    end
end
end