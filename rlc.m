%definizione dei parametri
R = 0;
L = 1e-3;
C = 1e-6;
%costruisco le matrici
A = [-R/L -1/L; 1/C 0];
B = [1/L 0]';
C1 = [0 1];
D = 0;
%condizioni iniziali
X0 = [0 0 ]';
s = tf('s');
U =1/s;
%calcolo la risposta nel dominio di Laplace
    %Y = C1*inv(s*eye(2)-A)*X0+(C1*inv(s*eye(2)-A)*B-D)*U;
%dato le condizioni nulle iniziali posso scrivere :
    %H = (C1*inv(s*eye(2)-A)*B-D);
    %Y = H*U;
%oppure :
Sys = ss(A,B,C1,D);
H = tf(Sys);
Y =H*U;
%calcolo scomposizione in fratti semplici
[num,den] = tfdata(Y,'v');
[r,p,k] = residue(num,den);
t = [0 : 0.00001 :0.2];
%calcolo l'antitrasformata a mano e viene :
y = 1 + 1e-3*exp(t.*-1e-6) - 1.001*exp(t.*-1.001e+3);
%dopo aver portato il grafico da simulink a matlab ne disegno il grafico col comando seguente :
%figure(1);
%plot(Ysim.time,Ysim.signals.values);
%grid;
%poi li sovrappongo per vedere se ho calcolato bene:
%hold on;
%plot(t,y,'r'); %scelgo il colore rosso