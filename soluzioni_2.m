%%esercizio 1 nodi equispaziati

f=@(x) 1./(1+x.^2);

for n= [5 9 13]
x= linspace(-5,5,n+1);
z= linspace(-5,5);
c=polyfit(x,f(x),n);
p=polyval(c,z);
figure(1)
plot(x,f(x),'ro',z,p,'b',z,f(z),'r')
pause
end

%%esercizio 1 con i nodi di chebyshev

f=@(x) 1./(1+x.^2);

a=-5;
b=5;

for n= [5 9 13]
t = -cos((2*(1:n+1)-1)*pi/(2*(n+1))); 
x = (b-a)/2*t+(b+a)/2;
z= linspace(-5,5);
c=polyfit(x,f(x),n);
p=polyval(c,z);
figure(1)
plot(x,f(x),'ro',z,p,'b',z,f(z),'r')
pause
end

%%esercizio 2 nodi equispaziati

f = @(x) sin(x);

g = @(x1) 1./(1+x1.^2);

for n=[5:5:15]
  x= linspace(0,pi,n+1);
  x1= linspace(-2*pi,2*pi,n+1);
  z=linspace(0,pi);
  z1=linspace(-2*pi,2*pi);
  c=polyfit(x,f(x),n);
  p=polyval(c,z);
  c1=polyfit(x1,f(x1),n);
  p1=polyval(c1,z1);
  hold on
  figure(1)
  plot(x,f(x),'ro',z,f(z),'r',z,p,'b')
  pause
  hold on
  figure(2)
  plot(x1,f(x1),'ro',z1,g(z1),'r',z1,p1,'b')
  pause
end

%ora rifaccio gli stessi calcoli ma con i nodi di cheby-lobatto

f = @(x) sin(x);

g = @(x1) 1./(1+x1.^2);

a=0;
b=pi;

a1=-2*pi;
b1=2*pi;

for n=[5:5:15]
  t=-cos((((1:1:n+1) -1)*pi)/n);
  x= ((b-a)/2)*t + (b+a)/2;
  x1= ((b1-a1)/2)*t + (b1+a1)/2;
  z=linspace(0,pi);
  z1=linspace(-2*pi,2*pi);
  c=polyfit(x,f(x),n);
  p=polyval(c,z);
  c1=polyfit(x1,g(x1),n);
  p1=polyval(c1,z1);
  err_int = abs(p-f(z));
  err_max = norm(p-f(z),inf)
  err_max1 = norm(p1-g(z1),inf)
  err_int1 = abs(p1-g(z1));
  hold on
  figure(1)
  plot(x,f(x),'ro',z,f(z),'r',z,p,'b')
  pause
  hold on
  figure(2)
  plot(x1,g(x1),'ro',z1,g(z1),'r',z1,p1,'b')
  pause
  hold on 
  figure(3)
  plot(z,err_int,'linewidth',2)
  pause
   hold on 
  figure(4)
  plot(z1,err_int1,'linewidth',2)
  pause
end

%%esercizio 3

f = @(x) 1./(1+x.^2);

a=-5;
b=5;

for n=[6:4:14]
    x=linspace(a,b,n);
    y=f(x);
    z=linspace(a,b);
    s= spline(x,y,z);
    figure(1)
    plot(x,y,'ro',z,f(z),'b',z,s,'r')
    err = norm(s-f(z),inf)
    pause
end

%%esercizio 4

f = @(x) (1-x.^2).^(5/2);

fd = @(x) (-5*x).*(1-x.^2).^(3/2);

f0 = fd(-1);
fn = fd(1);

a=-1;
b=1;

for k=2:5
    n=2^k;
    x=-1+2*(0:n)./n;
    z=linspace(a,b);
    s=spline(x,f(x),z);
    s1=spline(x,[f0 f(x) fn],z);
    err=(f(z)-s);
    err1 = (f(z)-s1);
    figure(1)
    plot(x,f(x),'ro',z,f(z),'b',z,s,'r')
    pause
    figure(2)
    plot(x,f(x),'ro',z,f(z),'b',z,s1,'r')
    pause
    figure(3)
    loglog(z,err,'b')
    pause
    figure(4)
    loglog(z,err1,'r')
    pause
    p=norm(f(z)-s,inf)
    p1=norm(f(z)-s1,inf)
end
    
%%esercizio 5

ora = 1:20;
azoto =[ 243 209 181 179 180 166 163 157 187 192 138 95 56 32 21 12 11 61 146 186];
z= interp1(1,20,10000);
s=spline(ora,azoto,z);
figure(1)
plot(ora,azoto,'ro',z,s,'r')
hold on
s1 = interp1(ora,azoto,[2.5 19.5])
plot([2.5 19.5],s1,'go','linewidth',3)
grid on