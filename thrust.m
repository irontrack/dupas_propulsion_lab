function T = thrust(time)

temp = [0 0 ;...
    0.036 1.364;...
   0.064 2.727;...
   0.082 4.215;...
   0.111 6.694;...
   0.135 9.05;...
   0.146 9.545;...
   0.172 11.901;...
   0.181 12.149;...
   0.191 11.901;...
   0.211 9.174;...
   0.239 7.314;...
   0.264 6.074;...
   0.275 5.95;...
   0.333 5.207;...
   0.394 4.835;...
   0.445 4.835;...
   0.556 4.339;...
   0.667 4.587;...
   0.723 4.339;...
   0.78 4.339;...
   0.793 4.091;...
   0.812 2.603;...
   0.833 1.24;...
   0.857 0.0];

    T = interp1(temp(:,1),temp(:,2),time,'linear','extrap'); 


end