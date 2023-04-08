clear; close all;
A = 1500;
G = A/(1+A);
tau = 3e-9;
H = tf([G],[tau,1]);
t = linspace(0, 62.5e-9, 1000);
u = 0.25*heaviside(t);

% Plot step response
lsim(H,u,t);
figure(1);
yline(0.5*(2/2048));

% Plot frequency response
options = bodeoptions;
options.FreqUnits = 'Hz';
figure(2);
bode(H,options);
grid;

% Open loop response
H_ol = tf([A], [1/150e3, 1]);
figure(3);
grid;
bode(H_ol, options);

% Test
H_cl = feedback(H_ol,1);
figure(4);
lsim(H_cl,u,t);