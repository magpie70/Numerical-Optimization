function [L, i] = fibonacci_search(f, a, b, n)
L0 = b-a;
k = 2;
i = 0;
while k ~= n
    L_kstar = fibonacci(n-k+1)/fibonacci(n+1)*L0;
    x1 = a+L_kstar;
    x2 = b-L_kstar;
    y1 = feval(f,x1);
    y2 = feval(f,x2);
    if y1>y2
        a=x1;
        L_kstar=fibonacci(n-k+1)/fibonacci(n+1)*(b-a);
    else
        if y1<y2
            b=x2;
            L_kstar=fibonacci(n-k+1)/fibonacci(n+1)*(b-a);
        end
    end
    k=k+1;
    i=i+1;
end
L = [a,b];
end