%% Determine if a matrix is a sqaure
function tf = issquare(A)
tf = false;
if isnumeric(A) && ismatrix(A)
    % A is numeric and A is 2-D matrix
    [m,n] = size(A);
    if m==n
        tf = true;
    end
end
end