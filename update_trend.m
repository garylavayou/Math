
function new_trend = update_trend(cur_trend, args2, options)

if isfield(options, 'bPurge') && options.bPurge
    len  = args2;
    b_purge = false(length(cur_trend),1);
    for i = 1:length(cur_trend)
        if cur_trend(end).index - cur_trend(i).index >= len
            b_purge(i) = true;
        else
            break;
        end
    end
    new_trend = cur_trend(~b_purge);
    return;
end

if isfield(options, 'trend') && ~isempty(options.trend)
    type = options.trend;
    len = options.length;
    new_value = args2;
    if strcmpi(type, 'ascend')
        for i = length(cur_trend):-1:0
            if i==0
                new_trend = new_value;
            elseif new_value.value > cur_trend(i).value
                new_trend = [cur_trend(1:i) new_value];
                break;
            end
        end
    else
        for i = length(cur_trend):-1:0
            if i==0
                new_trend = new_value;
            elseif new_value.value < cur_trend(i).value
                new_trend = [cur_trend(1:i) new_value];
                break;
            end
        end
    end
    if nargin >= 4
        if length(new_trend)>len
            new_trend = new_trend(2:end);
        end
    end
    return;
end

if isfield(options, 'bResetIndex') && options.bResetIndex
    if ~isempty(cur_trend)
        idx_offset = args2;
        for i = 1:length(cur_trend)
            cur_trend(i).index = cur_trend(i).index - idx_offset + 1;
        end
    end
end

end

