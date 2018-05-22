% READS IN THE TEST DATA FILE AND PLOTS THE FORCES

fil  = fopen('DPL.txt');
A = textscan(fil,'%f %f %f %f');
t= A{1};
t = t - t(1);
T = A{2} + A{3} + A{4};
plot(t,T)
fclose all;