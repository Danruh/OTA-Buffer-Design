clear; close all; clc;
%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants
K_p = 80/(2*1.3);
K_n = 310/(2*1.3);
%%%%%%%%%%%%%%%%%%%%%%%%%

% Enter width values
W_1_2  = 23.04;
%W_1_2 = 11.7;
W_9_10 = 6.84;
W_3_4  = 7.56;
W_5to8 = 1.44;

% Enter length values
L_1_2  = 0.18;
L_9_10 = 0.36;
%L_9_10 = 0.54;
%L_3_4  = 0.72;
L_3_4  = 0.68;
%L_5to8 = 0.54;
L_5to8 = 0.4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
lambda_1_2  = 0.033/(L_1_2-0.03);
lambda_9_10 = 0.033/(L_9_10-0.03);
lambda_3_4  = 0.033/(L_3_4-0.03);
lambda_5to8 = 0.033/(L_5to8-0.03);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
wl_1_2  = W_1_2/L_1_2;
wl_9_10 = W_9_10/L_9_10;
wl_3_4  = W_3_4/L_3_4;
wl_5to8 = W_5to8/L_5to8;

% Current budget
It = 100;

% Guess currents (uA)
I_9_10  = It/2;
I_3to8 = I_9_10/2;

% Input pair bias currents
I_12   = It/2;
I_1_2  = I_12/2;


% gm values
gm_1_2 = sqrt(K_n*I_1_2*wl_1_2)*10^-6;
gm_3_4 = sqrt(K_p*I_3to8*wl_3_4)*10^-6;
gm_5_6 = sqrt(K_p*I_3to8*wl_5to8)*10^-6;

disp("gm_1_2 = " + gm_1_2*10^6 + "uS");
disp("gm_3_4 = " + gm_3_4);
disp("gm_5_6 = " + gm_5_6);
disp(" ");

% rds values
rds_1_2  = 1/(lambda_1_2*I_1_2*10^-6);
rds_5to8 = 1/(lambda_5to8*I_3to8*10^-6);
rds_3_4  = 1/(lambda_3_4*I_3to8*10^-6);
rds_9_10 = 1/(lambda_9_10*I_9_10*10^-6);

disp("rds_1_2  = " + rds_1_2);
disp("rds_5to8 = " + rds_5to8);
disp("rds_3_4  = " + rds_3_4);
disp("rds_9_10 = " + rds_9_10);
disp(" ");

% Calculate impedences
rup   = gm_3_4*rds_3_4*( (rds_9_10*rds_1_2)/(rds_9_10+rds_1_2) );
rdown = gm_5_6*rds_5to8*rds_5to8;

ro  = rup*rdown/(rup+rdown);
Aol = gm_1_2*ro;

disp("Rup   = " + rup);
disp("Ddown = " + rdown);
disp("Rout = " + ro);
disp("Aol = " + Aol);