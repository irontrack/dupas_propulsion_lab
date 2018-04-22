% main driver for trajectory sim

launch_angle = 5;
dt = 0.001;
time = 0;

CD_V = input('vehicle CD:');
CD_P = input('parachute CD:');

% front vehicle angle
A_v = (pi/4)*(0.042)^2;
A_p = (pi/4)*(.4572)^2;

V_0 = 0;

Y_0 = 0;
i = 1;
% initial mass
mass = .071 ;
cont = true;
while cont
    
    if time == 0
        Y(i) = Y_0;
        V(i) = V_0;
    end
    % burn phase
    if time < 0.857
        
        mdot = thrust(time)/(9.81*78.81);
        mass = mass - mdot*dt;
        D = CD_V*0.5*density(Y(i))*(V(i)^2)*A_v;
        
        dv = (thrust(time)/mass)*dt - (D/mass)*dt - 9.81*cosd(launch_angle)*dt;
        V(i + 1) = V(i) + dv; 
        Y(i + 1) = Y(i) + V(i + 1)*dt;
    end
    
    % coast phase
    if (time > 0.857) && (time < 4.857)
  
        D = CD_V*0.5*density(Y(i))*(V(i)^2)*A_v;
        if(V(i) > 0 )
            D = -D;
        end
        dv = (D/mass)*dt - 9.81*cosd(launch_angle)*dt;
        V(i + 1) = V(i) + dv; 
        Y(i + 1) = Y(i) + V(i + 1)*dt;
    end
        
    % desent phase
    if (time > 4.857)
        
        
        D = CD_P*0.5*density(Y(i))*(V(i)^2)*A_p;
        if(V(i) > 0 )
            D = -D;
        end
        dv = (D/mass)*dt - 9.81*cosd(launch_angle)*dt;
        V(i + 1) = V(i) + dv; 
        Y(i + 1) = Y(i) + V(i + 1)*dt;
    end
    
    if(Y(i)<0)&&(time > 1)
        cont = false;
    end
    i = i + 1;
    time = time + dt;
    
    
    
end

