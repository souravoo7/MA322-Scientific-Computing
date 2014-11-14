%displays the magic square of size 4
%corresponding functions of eigenvalues and the eigenvectors of the said
%matrix
M=magic(4);
display(M);
[V,D]=eig(M);
display(V);
display(D);
N=V*D*inv(V);
display(N);