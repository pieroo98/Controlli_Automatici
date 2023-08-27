alfa = 1;
A = [ 0 alfa; alfa 0];
B = [ 1 0]';
C = [ 1 -1];
D = 0;
xo = [1 3]';
Sy = ss(A,xo,C,0);
Y = tf(Sy);
%eseguire sempre minreal per semplificare Y 

Y = minreal (zpk(Y))
[num,den] = tfdata(Y,'v');
[R,P,K] = residue(num,den);