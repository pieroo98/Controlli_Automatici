%%esercizio 2.1

n = 1:16;
x = 10.^(-n);
f1 = (1-cos(x))./x.^2;
f1_ex = 1/2*(sin(x/2)./(x/2)).^2;
er1 = abs(f1-f1_ex)./abs(f1_ex);
[x' f1' f1_ex' er1']
figure
loglog(x,er1,'linewidth',2)

%%esercizio 2.2

n=1:16;
x=10.^-n;
f1=(exp(x) - 1)./x;
f2=0;
for jj=1:length(n+1)
    f2 = f2 + x.^(jj-1)./factorial(jj);
end
err= abs(f1-f2)./abs(f2);
[ x' f1' f2' err']
figure(1)
loglog(x,err,'linewidth',2)

%%esercizio 2.3

n=1:16;
x=10.^-n;
y=1 - sqrt(1-x.^2);
y2= x.^2./(1+sqrt(1-x.^2));
err= abs(y-y2)./abs(y2);
[x' y' y2' err'];
figure
loglog(x,err,'linewidth',2)

%%esercizio 2.4

n=1:16;
x=10.^-n;
y=((x+1).^2 -1)./x;
y2= x +2;
err= abs(y-y2)./abs(y2);
[x' y' y2' err']
figure
loglog(x,err,'linewidth',2)

%%exe 3.0

m = 40;
x = zeros(m,1);
x(1) = 2;
for n = 2:m
    x(n) = 2^(n-1/2)*sqrt(1-sqrt(1-4^(1-n)*x(n-1)^2));
end
errore_relativo = abs(pi-x)/abs(pi);
semilogy(1:m,errore_relativo,'linewidth',2)
pause
%espressione equivalente
m = 40;
x = zeros(m,1);
x(1) = 2;
for n = 2:m
    x(n) = x(n-1)*sqrt(2/(1+sqrt(1-4^(1-n)*x(n-1)^2)));
end
errore_relativo = abs(pi-x)/abs(pi);
semilogy(1:m,errore_relativo,'linewidth',2)

%%esercizio 4

k=1:50;
h=2.^-k;
x=pi/4;
r=(sin(x+h)-sin(x))./h;
err=abs(cos(x)-r)./abs(cos(x));
figure
loglog(h,err,'linewidth',2)
pause
hold on
r2 = 2*sin(h/2).*cos(x+h/2)./h;   %formula di prostaferesi
err2 = abs(cos(x)-r2)/abs(cos(x));
loglog(h,err2,'g','linewidth',2)
