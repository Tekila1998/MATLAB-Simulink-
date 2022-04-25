g = 9.81; %Przyspieszenie ziemskie [m/s^2].
q = 0; % Stała elektromagnetyczna.   
L = 0.150; %Indukcyjność cewki. [H]
R = 5; %Rezystancja uzwojeń. [Ohm]
h = 0.0012; %Stała elektromechaniczna.

% Otoczenie punktu pracy.
x_e = 0.010;
v_e = 0;
i_e = x_e*sqrt(g/h);
u_e = i_e*R;


% Linearyzacja modelu.
A = [0 1 0; 2*h*((i_e^2/x_e^3)) 0 (-2*h)*((i_e)/(x_e^2)); 0 (q/L)*(i_e/x_e^2) -R/L];
B = [0;0;1/L];

[A1,B1,C1,D1] = linmod('Moj_model');


% Lokowanie biegunów.
K1 = [-60 -50 -40]; % Bieguny aperiodyczne
K2 = [-100 -10+i*50 -10-i*50]; % Bieguny oscylacyjne

K = acker(A,B,K1);
K_osc = acker(A,B,K2);


%LQR
Q = [100 0 0; 0 10 0; 0 0 1] %Macierz "kar"
r = 1e-5; %Macierz "kosztów"

K_lqr = lqr(A,B,Q,r);



