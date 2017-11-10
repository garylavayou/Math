%% evaluate if a matrix is a square triangle matrix
% This function is encapsulate matlab function: istril/istriu
function v = istriangle(A)
% [in]A: input matrix
% [out]v: check result. if A is left(low) triangle, return 1; if A is
%      right right(high) triangle, return 2; if A is diague diagonal
%      matrix, return 3. otherwise, return 0 for non-triangle matrix.
v = 0;
if issquare(A) == 0
    return;
end
% check right triangle
if istriu(A)
    r = 2;
else
    r = 0;
end
% check left triangle
if istril(A)
    l = 1;
else
    l = 0;
end
v = l + r;
end

