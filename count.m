%% Count occurence
function varargout = count(varargin)
%% Count occurence pattern of string
if ischar(varargin{1}) || isstring(varargin{1}) || iscell(varargin{1})
  [varargout{1:nargout}] = builtin('count', varargin{:});
  return;
end

%% count integers
data = varargin{1};
if nargin <= 1 
  types = unique(data, 'sort');
elseif ischar(varargin{2})
  types = unique(data, varargin{2});
else
  types = varargin{2};
end
n = numel(data);
counts = zeros(length(types),1);
for t = 1:length(types)
  counts(t) = nnz(data == types(t));
end
varargout = {types(:), counts};
if nargout >= 3
  if n > 0
    varargout{3} = counts/n*100;
  else
    varargout{3} = double.empty(0,1);
  end
end

end