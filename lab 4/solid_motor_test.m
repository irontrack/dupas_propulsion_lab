% READS IN THE TEST DATA FILE AND PLOTS THE FORCES

fil  = fopen('DPL.txt');
A = textscan(fil,'%f %f %f %f');
t= A{1};
t = (t - t(1))*1e-3;
T = A{2} + A{3} + A{4};
b = (1/5)*ones(1,5);
T_f = filter(b,1,T);
Total_Impulse = 0;
L = length(t);

for i = 768:867
    temp =(T_f(i) + T_f(i - 1))/2;
    dt = t(i)-t(i-1);
    Total_Impulse = Total_Impulse + temp*dt;
end
time = t(867) - t(768);
average_thrust = Total_Impulse/time;
fclose all;