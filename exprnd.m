function x = exprnd(varargin)
v = ver('stats');
if ~isempty(v) && license('test', 'statistics_toolbox')
  x = builtin('exprnd', varargin{:});
else
  if nargin == 1
    sizes = {1};
  else
    sizes = varargin(2:end);
  end
  x = -varargin{1}*log(rand(sizes{:}));     % varargin{1} is the 'mean_time'
end
%  x = 1/λ*ln(y)   y is uniform distribution

end

