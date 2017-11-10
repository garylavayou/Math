%% Block Diagonal
%
%% Function declaration
%   A = block_diag( block_elements )
% See also diag.
%% TODO: varargin
function A = block_diag( block_elements, k )
if nargin <= 1
    k = 1;
end
if isnumeric(block_elements)
    b = block_elements;
    block_elements = cell(1);
    block_elements{1} = b;
end
L = length(block_elements);
L1 = zeros(L,1);
L2 = zeros(L,1);
nz = 0;
for i = 1:L
    L1(i) = size(block_elements{i},1);
    L2(i) = size(block_elements{i},2);
    nz = nz + nnz(block_elements{i});
end
dim1 = sum(L1);
dim2 = sum(L2);
A = spalloc(dim1*k,dim2*k, nz*k);
x0 = 0;
y0 = 0;
for i = 1:L
    x = x0+(1:L1(i));
    y = y0+(1:L2(i));
    for j = 1:k
        A(x+dim1*(j-1),y+dim2*(j-1)) = block_elements{i};  %#ok
    end
    x0 = x0 + L1(i);
    y0 = y0 + L2(i);
end
end

