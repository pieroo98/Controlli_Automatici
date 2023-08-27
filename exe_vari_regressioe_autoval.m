%%exe con SVD

x= linspace(1,2,6);
A=vander(x);
B=zeros(6,6);
[U,S,V] = svd(A);
for i=1:4
    B= B+ S(i,i)*U(:,i)*V(:,i)';
end
norm(B,inf)


%%exe con taylor

x=10^-8;
y=sqrt((exp(x)-1)./x);
f=1;
for i=1:100
    f=f+x^(i)/factorial(i+1);
end
f=sqrt(f);
err=abs(f-y)/abs(y);


%%esercizio su parabola di regressione

f = @(x) x*sin(x);
x=linspace(0,pi/2,30);
y=[];
for n=1:30
    y(n)=f(x(n));
end
c=polyfit(x,y,2);

%%esercizio sulla parabola di regressione 

x=[-2 -1.3 -1 -0.7 -0.4 -0.1];
y=[0.3 0.5 1.5 1.3 0.8 0.1];
z=[-2.1,0];
c= polyfit(x,y,2);
p=polyval(c,z);
plot(x,y,'r*',z,p,'linewidth',2)
axis([-2.1 0 min(p) max(p)])
pr = polyval(c,3);
abs(pr-1.5)

%%exe retta di regressione di grado 1 

x=[0.2 1.14 0.54 0.87 1.25 2.36 0.19 0.54 0.51 0.33];
y=[1.25 2.36 2.58 1.87 2.68 3.41 0.65 0.47 1.36 1.25 ];
c=polyfit(x,y,1)

%%esercizio su minimi quadrati

M = magic(60);
I = eye(60);
B = M + I;
A = B(:,1:10);
b= A*ones(10,1);
[Q,R] = qr(A);
c=Q'*b;
x = R\c;
A_1= A'*A;
R=chol(A_1);
y=R'\(A'*b);
x1=R\y;
e=norm(ones(10,1)-x)/norm(ones(10,1))
e1=norm(ones(10,1)-x1)/norm(ones(10,1))

%%exe retta di regressione di grado 1 

x=[ 0 8 18];      %punti asse x
y= [ 44 43 67];     %punti asse y
c=polyfit(x,y,1);   %coefficienti retta grado 1
z=[-.5,19];         %estremi dominio
p= polyval(c,z);    %polinomio
plot(x,y,'r*',z,p,'linewidth',2)
axis([-0.5 19 min(p) max(p)])
pr = polyval(c,2);   % calcola il valore delle y in un generico punto (in questo caso il 2)


%%ex 4

M = magic(20);
I = eye(20);
B = M + I;
A = B(:,1:10);
b= A*ones(10,1);
[Q,R] = qr(A);
c=Q'*b;
x = R\c;
x1=A\b;
e=norm(ones(10,1)-x)/norm(ones(10,1))
e1=norm(ones(10,1)-x1)/norm(ones(10,1))



%%autovalori 1

for i=1:12
    for j=1:12
        if i==j
            A(i,j) = 2*i;
        end
        if i<j
            A(i,j) = -2/j;
        end
        if i>j
             A(i,j) = 2/j;
        end
    end
end
p = max(abs(eig(A)))

%%autovalori 2 metodo potenze

x=linspace(-1,1,10);    
A=vander(x);
z=ones(10,1);   %vettore iniziale
w=z/norm(z);    %normalizzo il vettore z in w
for i=1:24      
    z=A*w;          %aggiorno z
    lambda_max=w'*z;    %calcolo il valore massimo di lambda
    w=z/norm(z);        %normalizzo nuovamente w
end
w   %autovettore relativo a lambda_maz normalizzato


%%esercizio 3. potenze inverse

A=hilb(6);
p=0.2;      %valore di lambda da trovare vicino a questo
z=ones(6,1);
w=z/norm(z);
[L,U,P] = lu(A-p*eye(6));       %uso la fattorizzazione PA=LU
for i=1:4
              %    P(A - P*eye)z=P*w    L*U*z = P*w 
    y=L\(P*w);
    z=U\y;
    mu=w'*z;        % valore di lambda max opposto
                %  mu = 1/(l-p);
    l=p+1/mu;       %vero valore di lambda
    w= z/norm(z);
end
[d] = eigs(A,1,p)       %comando per fare lo stesso calcolo
err= abs(l-d)/abs(l)