f = @(x) x.*exp(x);
a=0;
b=1;
z=linspace(0,1,100);
for i=4
    t= -cos(([1:i+1]-1)*pi/4);
    x=((b-a)/2)*t + (b+a)/2;
    c=polyfit(x,f(x),4);
    p=polyval(c,z);
end
for i=8
    t1= -cos(([1:i+1]-1)*pi/8);
    x1=((b-a)/2)*t1 + (b+a)/2;
    c1=polyfit(x1,f(x1),8);
    p1=polyval(c1,z);
end
norm(f(z)-p1,inf)/norm(f(z)-p,inf)

%%ese 2

A= hilb(14);
z=ones(14,1);
w=z/norm(z);
for n=1:7
    z=A*w;
    lam = w'*z;
    w=z/norm(z);
end
p=eigs(A,1);
err= abs(p- lam)/abs(p)

%%eser 3

for i=1:100
    for j= 1:100
        A(i,j) = max(i,j);
    end
end
B=A'*A;
R=chol(B);
R(52,64)

%%exe 6

A= full(gallery('tridiag',100,1,5,-1));
lamb=eig(A);
lamb(100)
lamb(1)

%%esr 7
A=magic(3);
[Q,R]= qr(A);
b= [1 2 3]';
x=R\b

%%exe 5

f = @(x) 1- sqrt(1+x.^2);
x=10^-6;
f2 = @(x) -x.^2/(1+sqrt(1+x.^2));
err=abs(f2(x)-f(x))/abs(f2(x))