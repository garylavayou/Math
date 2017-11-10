%% Jacobian matrix
% % The evaluation method is differential, when function f's gradient has no explicit
% expression, this method is adopted.
function JA = jacobian( fv, x0)
%JACOBIAN return the Jacobian matrix of function vector f.
% f should be a row cell vector or column cell vector.
% x0 is the point, at which the Jacobian matrix should be retrived. it
% should be a row vector or column vector.
if isvector(x0) == false 
    error('input argument x0 is not a vector');
elseif isvector(fv) == false
    error('input argument fv is not a vector');
end
if isrow(x0)           % transform to column vector
    x0 = x0';
end
epsilon = 10^-5;
fx = fval(fv,x0);
m = length(fx);
n = length(x0);
JA = zeros(m,n);
for i = 1:n
    ei = zeros(n,1);
    ei(i) = 1;
    JA(:,i)=(fval(fv,x0+epsilon*ei)-fx)/epsilon;
end
end