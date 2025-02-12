iclear; clc; close all;

CD = 1.2;%1.2-1.5
rho = 1.225;%kg/m^3
D_drogue = 0.774;%m
D_main = 2.95;%m
A = pi/4*D_main^2;%m^2

%Descending velocity from OpenRocket
%Velocity at the main chute deployment at 500m.
v = 21.97;%m/s: 
v_kmh = 21.97*3600/1000;

FD_N = 1/2*CD*rho*A*v^2; %N
FD_kgf = FD_N/9.8;

prop_weight = 6.317396;%kg
rocket_total_weight = 23.784;%kg
m = rocket_total_weight - prop_weight;
a = FD_N/m;
a_G = a/9.8;

fprintf('Velocity at the main chute deployment: %f [km/h]\n',v_kmh);
fprintf('Generated drag force: %f [kgf]\n',FD_kgf);
fprintf('Instant deceleration by drag: %f [G]\n',a_G);




