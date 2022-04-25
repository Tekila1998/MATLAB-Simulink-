A = [0 1 0; 2*h*((i_e^2/x_e^3)) 0 (-2*h)*((i_e)/(x_e^2)); 0 (q/L)*(i_e/x_e^2) -R/L];
B = [0;0;1/L];

%% Sterowanie bez znajomości zmiennej stanu prądu

K_1= [-20 -9, -4.5];
k_1 = acker(A,B,K_1)
k = [k_1(1) k_1(2) 0];


%% Nastawy regulatora PID
kp = k_1(1);
Ti = 50;
Td = k_1(2)/k_1(1);
