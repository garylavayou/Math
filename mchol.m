function [ L, D ] = mchol( A )
% Modified Cholesky Factorization
% [in]A: square matrix
% [out]L: lower triangle matrix
% [out]D: diagonal matrix
if ~ismatrix(A)
    disp('input must be 2-dimension matrix.');
    return
end
if ~issquare(A)
    disp('matrix A must be a square mutrix.');
    return
end
n=length(A);
eta = max(diag(A));
xi = max(max(A-diag(diag(A))));
delta = sqrt(eps);
beta2 = max([eta, xi/sqrt(n^2-1), eps]);
D = zeros(n,n);
L = zeros(n,n);
for j=1:n
    C = zeros(1,n);
    C(j)=A(j,j);    % c(j) = c_jj
    for s=1:j-1
        C(j)=C(j)-D(s,s)*L(j,s)*L(j,s);
    end
    for i = j+1:n
        C(i) = A(i,j);  % C(i) = c_ij
        for s = 1:j-1
            C(i) = C(i)-D(s,s)*L(i,s)*L(j,s);
        end
    end
    % j = n, ((max(C(i)))^2)/beta2 = 0
    % C(i) = 0 (i < j+1)
    D(j,j)=max([abs(C(j)),((max(C(i)))^2)/beta2, delta]);
    for i = j+1:n
        L(i,j) = C(i)/D(j,j);
    end
    L(j,j)=1;
end
end

