%% Approximating the hessian matrix 
% Approximating the hessian matrix of smooth function f at a given point
% The evaluation method is differential, when function f's gradient has no explicit
% expression, this method is adopted.
function H = hessian(f,x0)
% [in]f: function handle
% [in]x0: the target point
% [out]H: the hessian matrix in the target point x0
if isvector(x0) == false
    error('point x0 is not a vector');
end
[n,m] = size(x0);
if n == 1
    x0 = x0';
    n = m;
end
H = zeros(n,n);
epsilon = 10^-5;
for i = 1:n
    for j = 1:n
        ei = zeros(n,1);
        ej = ei;
        ei(i) = epsilon;
        ej(j) = epsilon;
        H(i,j)=(f(x0+ei+ej)-f(x0+ei)-f(x0+ej)+f(x0))/(epsilon^2);
%        H(j,i) = H(i,j);
    end
end
end