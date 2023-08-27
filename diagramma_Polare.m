%diagramma polare
s = tf('s');
H = 1/(s^2+3*s+2);
[re, im ] = nyquist(H);
figure , plot(squeeze(re),squeeze(im))