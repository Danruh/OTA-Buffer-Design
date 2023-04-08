clear; close all; clc;

% Enter current budget
It = 100;

% Guess currents (uA)
I_9_10  = It/2;

% Input pair bias currents
I_12   = It/2;
I_1_2  = I_12/2;

I_3to8 = I_9_10/2;

% Enter bias voltages
V_od_9_10 = 0.3;
V_od_3_4  = 0.2;
V_od_5to8 = 0.25;


% Calculate W/L ratios
K_p = (2*1.3)/80;
K_n = (2*1.3)/310;

wl_9_10 = K_p*I_9_10/(V_od_9_10^2);
wl_3_4  = K_p*I_3to8/(V_od_3_4^2);
wl_5to8 = K_n*I_3to8/(V_od_5to8^2);

disp("W/L ratios are:");
disp("(W/L)9,10 = " + wl_9_10);
disp("(W/L)3,4  = " + wl_3_4);
disp("(W/L)5to8 = " + wl_5to8);