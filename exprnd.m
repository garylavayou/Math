function x = exprnd(varargin)
v = ver('stats');
if ~isempty(v) && license('test', 'statistics_toolbox')
  cmd_path = fullfile(matlabroot,'toolbox','stats\stats');
  old_path = cd(cmd_path);
  x = exprnd(varargin{:});   % expnd cannot be invoked by <builtin>.
  cd(old_path);
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

