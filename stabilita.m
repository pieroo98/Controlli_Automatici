b = 1;
a = 3;
A = [ 0 1 0; 0 0 1; -b -1 (1-a)];
B = [ 0 0 1]';
C = [ 1 0 3];
D = 0;
s = tf('s');
U = 3/s;
S = ss(A,B,C,D);
H = tf(S);
H = zpk(H);
Y = H*U;
[num,den] = tfdata(Y,'v');
[R,P,K] = residue(num,den);
% calcolo in modulo e la fase del coniugato complesso, quello positivo per
% antitrasformare la funzione Y
abs(R(2))
angle(R(2))
