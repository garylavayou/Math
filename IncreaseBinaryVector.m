%% Increase a bit for the binary vector

%% Parameters
%   |bin_vec|: binary vector, can be an array with arbitary dimension.
%   |bin_mask|: the same size with |bin_vec|, when the element of |bin_mask| is 1, the
%   corresponding bit of |bin_vec| should not be altered.
function bin_vec = IncreaseBinaryVector( bin_vec, bin_mask )
temp_bin = reshape(bin_vec, numel(bin_vec),1);
if nargin >= 2
    bin_mask = reshape(bin_mask, numel(bin_mask), 1);
end
b_carry = true;
for i = 1:length(temp_bin)
    if nargin >= 2 && bin_mask(i)
        continue;
    end
    if b_carry
        % temp_bin(i) = temp_bin(i) + 1;
        if temp_bin(i) == 1     %continue carrying the bit
            temp_bin(i) = 0;
        else
            temp_bin(i) = 1;
            b_carry = false;
        end
    end  
end
bin_vec = reshape(temp_bin, size(bin_vec));
end

