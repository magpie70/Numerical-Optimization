function [L, i] = golden_search(f, a, b, tol)
tau = (-1+sqrt(5))/2;
i = 0;
while abs(b-a) > tol
    x2 = a+tau*(b-a);
    x1 = b-tau*(b-a);
    y1 = feval(f,x1);
    y2 = feval(f,x2);
    if y1>y2
        a=x1;  
    else
        if y1<y2
            b=x2;
        end
    end
    i = i+1;
end
L = [a,b];
end