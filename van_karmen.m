% main driver for van karmen line sim

 for j = 1:6
launch_angle = 0;
dt = 0.001;

d = 1.25; % ft
s = 1.5;
presure = 300;
sigma_y = 45000;
thickness = (s*presure*d)/(2*sigma_y);
m_pay = 400/32.175;

hoop_area = (pi)*(((d/2)^2) - (d/2 - thickness)^2);
rho_a = (0.0975/32.175)*(12^3);
rho_prop = 48.3/32.175;
m_unit_length = rho_a*hoop_area;

fprintf('mass per unit length: %4.3f\n',m_unit_length)



CD_V = 0.75;
CD_P = 0.75;
% front vehicle angle
A_v = (pi/4)*(1.25)^2;
A_p = (pi/4)*(1.25)^2;

V_0 = 0;

Y_0 = 0;
vcm = 327360; %ft;
isp = 200:10:250;
thrust = 4500;
mdot = thrust/(32.175*isp(j));
A_tank = pi*((d/2 - thickness)^2);
alpha = (sqrt(2*32.175*vcm)+ 32.175*A_tank*50/mdot)/(32.175*isp(j) );

length = m_pay*(exp(alpha) - 1)/(m_unit_length*(1 - exp(alpha)) + A_tank*rho_prop);
m_prop = pi*((d/2 - thickness)^2)*length*rho_prop;
m_tank = m_unit_length*length;

% initial mass



    cont = true;
    i = 1;
    time = 0;
    mass = m_pay + m_prop + m_tank; 
    while cont

        if time == 0
            Y(i) = Y_0;
            V(i) = V_0;
        end
        % burn phase
        if mass > (m_pay + m_tank)

            
            mass = mass - mdot*dt;
            D = CD_V*0.5*0.00194*density(0.3048*Y(i))*(V(i)^2)*A_v;

            dv = (thrust/mass)*dt - (D/mass)*dt - 32.175*cosd(launch_angle)*dt;
            V(i + 1) = V(i) + dv; 
            Y(i + 1) = Y(i) + V(i + 1)*dt;
        end

        % coast phase
        if mass <= (m_pay + m_tank)

            D = CD_V*0.5*0.00194*density(0.3048*Y(i))*(V(i)^2)*A_v;
            if(V(i) > 0 )
                D = -D;
            end
            dv = (D/mass)*dt - 32.175*cosd(launch_angle)*dt;
            V(i + 1) = V(i) + dv; 
            Y(i + 1) = Y(i) + V(i + 1)*dt;
        end

       
        if(Y(i)<0)&&(time > 1)
            cont = false;
        end
        i = i + 1;
        time = time + dt;



    end
    
    t = 0:dt:(i-1)*dt;
    plot(t,Y)
    hold on
    fprintf('length:%5.3f\n',length)
    
 end

