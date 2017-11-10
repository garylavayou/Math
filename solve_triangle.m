% solve linear eqautions by substute the right triangle efficiient matrix
function x = solve_triangle(triA, b, type)
% [in]triA: triangle coefficient matrix
% [in]b: right part in the equation
% [in]type: 1,left triangle;2, right triangle; 3,diagnoal.
% [out]x: the solution of the linear equations
if ~issquare(triA)
    error('rt is not a square matrix');
end
if type<0 || type >3
    error('type''value is invalid');
end
DELTA = sqrt(eps);
n = size(triA,1);
if type == 3
    for i = 1:n
        if abs(triA(i,i))<DELTA
            error('matrix triA is rank-deficient');
        end
        b(i) = b(i)/triA(i,i);
    end
else
    if type == 1  % left(low) triangle
        d = 1;
        i_start = 1;
        i_end = n;
    else         % right(high) triangle
        d = -1;
        i_start = n;
        i_end = 1;
    end
    for i = i_start:d:i_end
        if abs(triA(i,i))< DELTA
            error('matrix triA is rank-defficient');
        end
        b(i) = b(i)/triA(i,i);
        triA(i,i) = 1;
        for j = i+d:d:i_end    
            % if right triangle && i<=1, j is empty-matrix
            % if left triangle && i>=n , j is empty-matrix
            b(j) = b(j)-triA(j,i)*b(i);
            triA(j,i) = 0;
        end
    end
    x = b;
end
end

% solve linear eqautions by substute the right triangle efficiient matrix
% function x = solve_rt(rt, b)
% if b_square(rt) == 0
%     error('rt is not a square matrix');
% end
% n = size(rt,1);
% for i = n:-1:1
%     b(i) = b(i)/rt(i,i);
%     rt(i,i) = 1;
%     for j = i-1:-1:1    % if i<=1, j is empty-matrix
%         b(j) = b(j)-rt(j,i)*b(i);
%         rt(j,i) = 0;
%     end
% end
% x = b;
% end
% 
% solve linear eqautions by substute the right triangle efficiient matrix
% function x = solve_lt(lt, b)
% if b_square(lt) == 0
%     error('rt is not a square matrix');
% end
% n = size(lt,1);
% for i = 1:n
%     b(i) = b(i)/lt(i,i);
%     lt(i,i) = 1;
%     for j = i+1:n    % if i=n, j is empty-matrix
%         b(j) = b(j)-lt(j,i)*b(i);
%         lt(j,i) = 0;
%     end
% end
% x = b;
% end