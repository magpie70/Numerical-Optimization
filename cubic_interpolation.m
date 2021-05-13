function [x_min, f_min,i, c1, c2] = cubic_interpolation(f,f_deriv,x1,x2,tolerance)
f1 = feval(f,x1);
f2 = feval(f,x2);

f_deriv1 = double(subs(f_deriv,x1));
f_deriv2 = double(subs(f_deriv,x2));
b = 3*(f1-f2)/(x2-x1) + f_deriv2 + f_deriv1; 
a = (b^2-f_deriv1*f_deriv2)^.5;
c1 = x1 + (f_deriv1 + b + a)*(x2 - x1)/(2*a + f_deriv1 + f_deriv2);
c2 = x1 + (f_deriv1 + b - a)*(x2 - x1)/(2*a + f_deriv1 + f_deriv2);
c3 = max(c1,c2);
p = double(subs(f_deriv,c3));
i = 0;
while (abs(p)>tolerance)
    f1 = feval(f,x1);
    f2 = feval(f,x2);
    f_deriv1 = double(subs(f_deriv,x1));
    f_deriv2 = double(subs(f_deriv,x2));
    b = 3*(f1-f2)/(x2-x1) + f_deriv2 + f_deriv1;
    a = (b^2-f_deriv1*f_deriv2)^.5;
    c1 = x1 + (f_deriv1 + b + a)*(x2 - x1)/(2*a + f_deriv1 + f_deriv2);
    c2 = x1 + (f_deriv1 + b - a)*(x2 - x1)/(2*a + f_deriv1 + f_deriv2);
    c3 = max(c1,c2);
    p = double(subs(f_deriv,c3));

    if p<0
    x1 = c3;
    elseif p>0
    x2 = c3;
    end
    
i = i+1;
end
x_min = c3;
f_min = feval(f,c3);
end