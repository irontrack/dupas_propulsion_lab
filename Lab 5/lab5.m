
 raw_data = cell(6,1);
 dt = 1/25;
 for i = 15:20
    file_id  = ['RUN' num2str(i) '.DAT'];
    temp = load(file_id);
    L = length(temp(:,1));
    T = zeros(L,1);
    for j = 1:L
        if j ==  1
        else
            T(j) = T(j - 1) + dt;
        end
    end
   
    raw_data{i - 14,1} = [T, temp(:,3)];
    figure(i - 14)
    plot(T,temp(:,3))
    grid on
    xlabel('time (s)')
    ylabel('altitude (m)')
 end
 velocity = zeros(6,1);
 
 
            