% check if a matrix is a square
function b = b_vector(A)
m_size = size(A);
b = true;
if length(m_size) ~= 2 || (m_size(1)~=1 && m_size(2)~=1)
    % not a vector
    b = false;
end
end

%% NOTE: this function is deprecated, since there is a matlab verison
% isvector/isrow/iscolumn 