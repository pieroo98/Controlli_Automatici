s = tf('s');
H = 1/((s+2)*(s+10));
U = 2;
w = 0.5;
 
%calcola modulo e fase di H calcolati in w e li assegna a mag e ph.
[mag, ph] = bode(H,w);
modulo = mag
fase = ph* pi/ 180