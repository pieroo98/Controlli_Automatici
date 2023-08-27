clear all
s = tf('s');
H = (2*s+1)/(s+4)^2;
U = 2/s^2;
Y = H*U;
[num,den] = tfdata(Y,'v');
[r,p,k] = residue(num,den)