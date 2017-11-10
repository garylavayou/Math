function [L, D] = ldlt_chol(A)
% LD Cholesky Factorization
% [in]A: square matrix
% [out]L: lower triangle matrix
% [out]D: diagonal matrix
if ~ismatrix(A)
    disp('input matrix must be 2-dimension.');
    return;
end
if ~issquare(A)
    disp('matrix A must be a square mutrix.');
    return
end
n = length(A);
D=zeros(n,n);
L=zeros(n,n);
for j=1:n
    cjj=A(j,j);
    for s=1:j-1
        cjj=cjj-D(s,s)*L(j,s)*L(j,s);
    end
    D(j,j)=cjj;
    for i=j+1:n
        cij=A(i,j);
        for s=1:j-1
            cij=cij-D(s,s)*L(i,s)*L(j,s);
        end
        L(i,j)=cij/D(j,j);
    end
    L(j,j)=1;
end
end