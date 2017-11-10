%% Integer Random Number Sequence
% Each number in the sequence is unique.

%% Method Declaration
%   d = unique_randi( imax, n, setOrder )
%   d = unique_randi( [imin imax], n, setOrder )
%
% |setOrder|: 'stable'- keep the original order; 'sorted'-sort the array;
% The function sort the output array by default.
% |d|: random number sequence as a column vector.
function d = unique_randi( imax, n, setOrder )
if nargin == 2
	setOrder = 'sorted';
end
if length(imax)==2
    imin = imax(1) - 1;
    imax = imax - imin + 1;
else
    imin = 0;
end
if imax == n && strcmpi(setOrder, 'sorted')
    d = (1:n)'+imin;
    return;
elseif imax < n
	error('Error: invalid argument value IMAX or N.');
end
n = min(imax, n);
d = unique(randi(imax, n, 1), setOrder);
flag = zeros(imax,1);
ld = length(d);
while ld<n
    flag(d) = 1;
    d_reverse = find(flag==0);
    d_new = d_reverse(unique(randi((imax-ld), n-ld, 1),setOrder));
    flag(d_new) = 1;
    d = unique([d; d_new], setOrder);
    ld = length(d);
end
d = d + imin;
end

