function n = numberemptycell( c )
n = 0;
for i = 1:numel(c)
    if isempty(c{i})
        n = n + 1;
    end
end
end

