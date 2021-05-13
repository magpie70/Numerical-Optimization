function [x_min, f_min,i] = quadratic_interpolation(f,x1,x2,x3,tolerance)
f1 = feval(f,x1);
f2 = feval(f,x2);
f3 = feval(f,x3);
A = (x1-x2)*(x1-x3);
B = (x2-x1)*(x2-x3);
C = (x3-x1)*(x3-x2);
x4 = ((f1*(x2+x3))/A + (f2*(x1+x3))/B + (f3*(x1+x2))/C)/(2*(f1/A + f2/B + f3/C));
f4 = feval(f,x4);
i=0;
while abs(x4-x2) > tolerance && abs(f4-f2)>tolerance
    if x4>x2 && f4 >= f2
        x3 = x4;
    elseif x4>x2 && f4 < f2
        x1 = x2;
        x2 = x4;
    elseif x4<x2 && f4 >= f2
        x1 = x4;
    elseif x4<x2 && f4 < f2
        x3 = x2;
        x2 = x4;
    end
f1 = feval(f,x1);
f2 = feval(f,x2);
f3 = feval(f,x3);
A = (x1-x2)*(x1-x3);
B = (x2-x1)*(x2-x3);
C = (x3-x1)*(x3-x2);
x4 = ((f1*(x2+x3))/A + (f2*(x1+x3))/B + (f3*(x1+x2))/C)/(2*(f1/A + f2/B + f3/C));
f4 = feval(f,x4);
i=i+1;
end
x_min = x4;
f_min = feval(f,x_min);
end