rho_p = 1000; % [kg/m^3]
a_d = 6; %[mm]
a = 0.033;
n = 0.2;
R_f = 25; % [mm]
R_0 = 4;
cf = 1.5;
P_0 = 101325*1e-6; % [N/m^2]
c_star = 1200; % [m/s]
A_burn = pi*2*R_0^2; % [mm^2]
A_star = 12.56; % [mm^2]
%note:convert all calculations with P in PA
% switch from m to mm.

dR = 0.1;
t = zeros(1,211);
T = zeros(1,211);
T(1) = P_0*A_star*cf;
Total_Impulse = 0;
R = R_0:dR:R_f;
r_dot = (a*P_0^n);
r_new = 0;
A_b = zeros(1,211);

for i = 2:211
    h = (2*R(i) - sqrt(4*R(i)^2 - 4*a_d^2))/2;
    if R(i) <= a_d
        A_burn = 2*pi*R(i)^2;
    else
        A_burn = pi*(h^2 + a_d^2);
    end
    A_b(i) = A_burn;
    P_new = (A_burn/A_star)*rho_p*r_dot*c_star*1e-6;
    r_new = (a*P_new^n);
    r_av = ((r_dot + r_new)/2)*1e3;
    r_dot = r_new;
    dt = 0.1/r_av;
    t(i) = t(i - 1) + dt;
    T(i) = P_new*A_star*cf;
    Total_Impulse = Total_Impulse + T(i)*dt;
    
end

Average_Thrust = Total_Impulse/t(211);
     plot(t,T)
     figure (2)
     plot(t,R)
    figure (3)
    plot(t,A_b)
    
    