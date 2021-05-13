function  [r i table] = Regula_Falsi(f, high, low, tol)
i = 0;
table = [];
y1 = feval(f,high);
y2 = feval(f,low);
while (abs(low-high) >= tol)
    i = i+1;
    r = (y1*low-y2*high)/(y1-y2);
    y3 = feval(f,r);
    table = [table; i, low, high, r, feval(f, r)];
    if y2 * y3 < 0
        high = r;
    else
        low = r;
    end
end
end