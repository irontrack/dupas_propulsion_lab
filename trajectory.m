% main driver for trajectory sim

launch_angle = 5;
dt = 0.001;
% front vehicle angle
A_v = (pi/4)*(0.0396)^2;
A_p = (pi/4)*(2.54*12/100)^2;

CD_V = [0;0.5;0.8];
CD_P = [0 ;1.5 ; 2]; 


for j = 1:3
    clearvars Y X
    time = 0;
  

    V_0 = 0;

    Y_0 = 0;
    i = 1;
    % initial mass
    mass = 0.037 ;
    cont = true;
    while cont

        if time == 0
            Y(i) = Y_0;
            V(i) = V_0;
        end
        % burn phase
        if time < 2.024

            mdot = thrust(time)/(9.81*83.25);
            mass = mass - mdot*dt;
            D = CD_V(j)*0.5*density(Y(i))*(V(i)^2)*A_v;

            dv = (thrust(time)/mass)*dt - (D/mass)*dt - 9.81*cosd(launch_angle)*dt;
            V(i + 1) = V(i) + dv; 
            Y(i + 1) = Y(i) + V(i + 1)*dt;
        end

        % coast phase
        if (time > 2.024) && (time < 4.024)

            D = CD_V(j)*0.5*density(Y(i))*(V(i)^2)*A_v;
            if(V(i) > 0 )
                D = -D;
            end
            dv = (D/mass)*dt - 9.81*cosd(launch_angle)*dt;
            V(i + 1) = V(i) + dv; 
            Y(i + 1) = Y(i) + V(i + 1)*dt;
        end

        % desent phase
        if (time > 4.024)


            D = CD_P(j)*0.5*density(Y(i))*(V(i)^2)*A_p;
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
    t = 0:dt:(i - 1)*dt;
    plot(t,Y)
    hold on
    fprintf('landing velocity: %6.3f\n',V(i - 10))
end


grid on
legend('no drag','CD_v = 0.5','CD_v = 0.8')
 