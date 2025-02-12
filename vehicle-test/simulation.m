clear; clc; close all;

CD = 1.2;%1.2-1.5
rho = 1.225;%kg/m^3
D_drogue = 0.774;%m
D_main = 2.95;%m
A = pi/4*D_main^2;%m^2

v_kmhs = [10,20,30,40,50,60,70,80];%km/h
FD_kgfs = [];
a_Gs = [];
for idx=1:length(v_kmhs)
   v_kmh = v_kmhs(idx);
    v = v_kmh*1000/3600;%m/s

    FD_N = 1/2*CD*rho*A*v^2; %N
    FD_kgf = FD_N/9.8;

    m = 2600;%kg
    a = FD_N/m;
    a_G = a/9.8;
    
    FD_kgfs(end+1) = FD_kgf;
    a_Gs(end+1) = a_G;
end

yyaxis left;
plot(v_kmhs,FD_kgfs);
title('Main parachute drag force');
xlabel('Vehicle speed [km/h]');
ylabel('Drag force [kgf]');
big;

hold on;
yyaxis right
plot(v_kmhs,a_Gs);
title('Main parachute simulation');
xlabel('Vehicle speed [km/h]');
ylabel('Instant deceleration [G]');

big;
grid on;
legend('Drag force','Deceleration');

% fprintf('Generated drag force: %f [kgf]\n',FD_kgf);
% fprintf('Instant deceleration by drag: %f [G]\n',a_G);




