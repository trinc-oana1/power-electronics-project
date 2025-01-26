
U_in = 48;
U_out = 12;
frequency = 1500;
R = 2.4;

L = 0.006;
C = 0.000104;
I_out = 5;

sigma = 0.06;
t_r = 0.007;
zeta = (abs(log(sigma)))/sqrt(log(sigma)^2 + pi^2);

w_n = 4/(t_r* zeta);

A = [0 -1/L; 1/C -1/(R*C)];
B = [U_in/L; 0];
C = [0 1];
D = 0;

[nump, denp] = ss2tf(A, B, C, D);
H_p = tf(nump, denp);

H_o = tf([0, w_n^2], [1, 2*zeta*w_n, w_n^2]);
H_c = 1/H_p * H_o/(1-H_o);
% H_c = 1/H_p * feedback(H_o, 1);
[numc, denc] = tfdata(H_c);


