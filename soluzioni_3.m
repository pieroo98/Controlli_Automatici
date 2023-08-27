%%esercizio 1

format long e
k=[];
for n=5:5:15
    A = hilb(n);
    b= sum(A,2);
    x=A\b;
    err=norm(ones(n,1)-x,inf)/norm(ones(n,1),inf);
    k = cond(A,inf)
end

%%esercizio 2

for i=1:100
    for j=1:100
        A(i,j)=max([i j]);
    end
end
b=sum(A,2);
x=A\b;
[L,U,P] = lu(A);
y = L\(P*b);
x1 = U\y;
err= norm(ones(100,1)-x,inf)/norm(ones(100,1),inf);

%%esercizio 3

for i=1:100
    for j=1:100
        A(i,j) = i*max([i j]);
    end
end
[L,U,P] = lu(A);
R=inv(L)*inv(U)*P;
s=inv(A);
err=norm(R-s,inf)/norm(s,inf)

%%esercizio 4

A=rand(100);


%%esercizio 5

B = full(gallery('tridiag',100,-5,10,5));
A=B'*B;
R=chol(A);
b=sum(A,2);
inv_A= inv(R)*(inv(R))';
x=inv_A*b;
x1=A\b;
err_inv= norm(inv(A)-inv_A,inf)/norm(inv(A),inf);
k=norm(ones(100,1)-x,inf)/norm(ones(100,1),inf);
k1=norm(ones(100,1)-x1,inf)/norm(ones(100,1),inf);

%%esercizio 6

t=0;
t1=0;
rap=[];
for n=100:100:500
    A=rand(n);
    b=sum(A,2);
    tic
    [Q,R] = qr(A);
    x=R\(Q'*b);
    err= norm(ones(n,1)-x,inf)/norm(ones(n,1),inf)
    t=toc;
    tic
    [L,U,P] = lu(A);
    y =L\(P*b);
    x1=U\y;
    err1=norm(ones(n,1)-x1,inf)/norm(ones(n,1),inf)
    t1=toc;
    rap=t1/t
end

t2=0;
t3=0;
rap1=[];
for n=1000:1000:5000
    A1=rand(n);
    b1=sum(A1,2);
    tic
    [Q,R] = qr(A1);
    x2=R\(Q'*b1);
    err2= norm(ones(n,1)-x2,inf)/norm(ones(n,1),inf)
    t2=toc;
    tic
    [L,U,P] = lu(A1);
    y1 =L\(P*b1);
    x3=U\y1;
    err3=norm(ones(n,1)-x3,inf)/norm(ones(n,1),inf)
    t3=toc;
    rap1=t3/t2
end

