load('lab5_velocities')

Vav_square = sum(v(1:3,1))/3; 
Vav_circle = sum(v(4:6,1))/3;
% Vav_square = (1/3.3)*Vav_square;
% Vav_circle = (1/3.3)*Vav_circle;
L = 18*2.54/100;
S_sq = L^2;
S_cir = (pi/4)*L^2;
mass_sq = 0.011;
mass_cir = 0.0115;
rho = 1.214;
CD_sq = mass_sq*9.81/(.5*rho*(Vav_square^2)*S_sq);
CD_cir = mass_cir*9.81/(.5*rho*(Vav_circle^2)*S_cir);