A = full(gallery('tridiag',18,3,6,3));
for j=1:3
    B(:,j) = linspace(0,j,18);
    x(:,j)=A\B(:,j);
end
z=zeros(18,1);
for j=1:3
   z=z+x(:,j); 
end
norm(z,2)