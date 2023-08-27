clear all
s = tf('s');
H = 5/(s +3);
U = 2/s^2;
Y = H*U;
[num,den] = tfdata(Y,'v');
[r,p,k] = residue(num,den);
[numh,denh] = tfdata(H,'v');