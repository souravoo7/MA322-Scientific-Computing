A=[1,2,3,4;1,2,3,4;1,1,2,3;4,5,6,7];
B=[1,2,3,4;1,2,3,4;1,1,2,3;4,5,6,7];
% or use A-rand(4,4)
display(A);
display(B);
%(A*B)
display(A*B);
%inv(A*B)
display(inv(A*B));
%(inv(A*B))'
display((inv(A*B))');
%inv((A*B)')
display((inv((A*B)')));
%(B'*A')
display(B'*A');
%inv(inv(B)*inv(A))
display(inv(inv(B)*inv(A)));
%(B'*A')'
display((B'*A')');
