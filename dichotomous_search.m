function [L, middle, i] = dichotomous_search(f, a, b, epsilon)
i = 0;
while abs(b-a) > epsilon
    x0 = (a+b)/2;
    x1 = x0-epsilon/2;
    x2 = x0+epsilon/2;
    y1 = feval(f,x1);
    y2 = feval(f,x2);
    if y1>y2
       a=x0;  
    elseif y1<y2
       b=x0;
    else
        a = x1;
        b = x2;
    end
    i = i+1;
end
L = [a, b];
middle = x0;
end

