%% Evaluate functions' value at the given point.
function VAL = fval(fv, x0)
% [in]fv: function handle vector or matrix
% [in]x0: 
if isvector(x0) == fasle 
    error('input argument x0 is not a vector');
end
[m,n] = size(fv);
VAL = zeros(m,n);
for i = 1:m
    for j = 1:n
        f = fv{i,j};
        VAL(i,j) = f(x0);
    end
end
end