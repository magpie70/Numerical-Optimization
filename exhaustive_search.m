function [L, middle, i] = exhaustive_search(f, a, b, n)
i = 0;
delta = (b-a)/n;
x1 = a+delta;
x2 = x1+delta;
x3 = x2+delta;

while 1
    i = i+1;
    y1 = feval(f,x1);
    y2 = feval(f,x2);
    y3 = feval(f,x3);
    if y1>=y2 && y2<=y3
        break
    end
    x1 = x2;
    x2 = x3;
    x3 = x2+delta;
end
L = [x1, x3];
middle = x2;
end