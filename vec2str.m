function pt_str = vec2str( pt )
%VEC2STR format a point as a charactor string.

if ~isvector(pt)
    error('pt is not a vector of point.');
end
pt_str = sprintf('(');
len_pt = length(pt);
if len_pt > 6
    len_pt = 6;
end
for i=1:(len_pt-1)
    pt_str = strcat(pt_str,sprintf('%G, ',pt(i)));
end
if len_pt < length(pt)
    pt_str = strcat(pt_str,sprintf('%G, ...)',pt(len_pt)));
else
    pt_str = strcat(pt_str,sprintf('%G)',pt(len_pt)));    
end
end

