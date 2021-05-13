function  [n i table] = Newton(f, f1, start, tol)
i = 0;
table = [];
y1 = feval(f, start);
y2 = feval(f1, start);
while (abs(y1/y2) >= tol)
    i = i + 1;
    n = start - y1/y2;
    table = [table; i, start, n, feval(f, n)];
    if abs(n-start) >= tol
        y1 = feval(f, n);
        y2 = feval(f1,n);
        start = n;
    else 
        break
    end
    end
end