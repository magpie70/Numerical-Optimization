function [L, middle, i] = fixed_step(f, a, step)
i = 0;
x1 = a;
x2 = x1 + step;  
x3 = x2 + step;
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
    x3 = x2+step;
end
L = [x1, x3];
middle = x2;
end