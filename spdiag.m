function s = spdiag(d)
% see also <diag>
if ~isvector(d)
	error('error: parameter should be a vector.');
end
s = spalloc(length(d), length(d), nnz(d));
for i = 1:length(d)
	s(i,i) = d(i); %#ok<SPRIX>
end
end

