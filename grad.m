%% Evaluate function derivatives
% Evaluate function derivatives of function at the given point.
% The evaluation method is differential, when function f's gradient has no explicit
% expression, this method is adopted.
function g = grad(f,x0,i)
% [in]f: the function handle
% [in]x0: the point, at which the derivative should be retrived
% [out]g: the derivate value at x0
if isvector(x0) == false
    error('input argument x0 is not a vector');
end
if nargin == 2
    i = 0;
end
[n, m] = size( x0 );
if n == 1           % transform to column vector
    x0 = x0';
    n = m;
end
epsilon = 10^-5;
if i > n || i< 0
    error('invalid value of argument i, out of x0''s bound');
elseif i ~= 0      % only solve the ith partial derivative
    h = zeros(n,1);
    h(i) = epsilon;
    g = (f(x0+h)-f(x0-h))/(2*epsilon);
else               % solve the gradient
    g = zeros(n,1);
    for i = 1:n
        h = zeros(n,1);
        h(i) = epsilon;
        g(i) = (f(x0+h)-f(x0-h))/(2*epsilon);        
    end
end
end