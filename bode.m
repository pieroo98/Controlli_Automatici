%%
s = tf('s');
H = 125/s^3;
bode(H); %per stampare il grafico
%per calcolare precisamente i punti del mio diagramma definisco l'asse
%delle frequenze
omega = logspace(-5,4,1000); % i primi due valori sono gli esponenti in
%base 10 mentre il terzo numero è il numero di punti.
 bode(H,omega);
 %%
 s = tf('s');
 H = -(1-s)/(s*(1+s^2));
 omega = logspace(-5,4,10000);
 bode(H,omega)