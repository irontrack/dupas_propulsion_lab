% clean up for lab 3 wind tunnel test data
rho = 1.347;
mu = 1.789e-5;
test_data = fopen('test.txt','r');

data = textscan(test_data,'%f %f %f %f %f %f %f %*[^\n]');

fclose(test_data);

data = [data{1,:}];
k = 1;
for i = 1:4
    
    switch i
        case 1
            
            nose_coneFR1 = zeros(7,7);
            l = 1;
            for j = 10:5:40
                average = 0;
                
                while abs(j - data(k,7)) < 2
                    
                    nose_coneFR1(l,:) = nose_coneFR1(l,:) + data(k,:);
                    k = k +1;
                    average = average + 1;
                end
                nose_coneFR1(l,:) = nose_coneFR1(l,:)/average;
             l = l + 1;
            end
           FR = 1;
           L = 0.3048*.667;
           RE = nose_coneFR1(:,7)*L*rho/mu;
           ql = 0.5*rho*(nose_coneFR1(:,7).^2)*L;
           plot(RE,nose_coneFR1(:,1)./ql)
           xlabel('Reynold''s Number')
           ylabel('drag coefficient')
           title('Nose Cone FR1')
           grid
           
           figure (2)
           plot(RE,nose_coneFR1(:,1))
           grid
            xlabel('Reynold''s Number')
           ylabel('drag force')
           title('Nose Cone FR1')
          case 2
            
            nose_cone_half = zeros(7,7);
            l = 1;
            for j = 10:5:40
                average = 0;
                while abs(j - data(k,7)) < 2
                    
                    nose_cone_half(l,:) = nose_cone_half(l,:) + data(k,:);
                    k = k +1;
                    average = average + 1;
                end
                nose_cone_half(l,:) = nose_cone_half(l,:)/average;
             l = l + 1;
            end
              FR = 4;
           L = 0.3048*.667;
           RE = nose_cone_half(:,7)*L*rho/mu;
           ql = 0.5*rho*(nose_cone_half(:,7).^2)*L;
           figure(3)
           plot(RE,nose_cone_half(:,1)./ql)
           xlabel('Reynold''s Number')
           ylabel('drag coefficient')
           title('Nose Cone half power')
           grid
           
           figure (4)
           plot(RE,nose_cone_half(:,1))
           grid
            xlabel('Reynold''s Number')
           ylabel('drag force')
           title('Nose Cone half')
          case 3
            
            sd_8020 = zeros(7,7);
            l = 1;
            
            for j = 10:5:40
                average = 0;
                
                while abs(j - data(k,7)) < 2
                    
                    sd_8020(l,:) = sd_8020(l,:) + data(k,:);
                    k = k +1;
                    average = average + 1;
                end
                sd_8020(l,:) = sd_8020(l,:)/average;
             l = l + 1;
            end
            L = 0.3048*.667;
           RE = sd_8020(:,7)*L*rho/mu;
           ql = 0.5*rho*(sd_8020(:,7).^2)*L;
           figure(5)
           plot(RE,sd_8020(:,1)./ql)
           xlabel('Reynold''s Number')
           ylabel('drag coefficient')
           title('sd 8020')
           grid
           
           figure (6)
           plot(RE,sd_8020(:,1))
           grid
            xlabel('Reynold''s Number')
           ylabel('drag force')
           title('sd 8020')
            case 4
            
            clark = zeros(7,7);
            l = 1;
            for j = 10:5:40
                average = 0;
                while abs(j - data(k,7)) < 2
                    
                    clark(l,:) = clark(l,:) + data(k,:);
                    if k < 292
                        k = k +1;
                    else
                        break
                    end
                    average = average + 1;
                end
                clark(l,:) = clark(l,:)/average;
                
             l = l + 1;
            end
            L = 0.3048*0.667;
            RE = clark(:,7)*L*rho/mu;
           ql = 0.5*rho*(clark(:,7).^2)*L;
           figure(7)
           plot(clark(:,1)./ql)
           xlabel('Reynold''s Number')
           ylabel('drag coefficient')
           title('clark')
           grid
           
           figure (8)
           plot(RE,clark(:,1))
           grid
            xlabel('Reynold''s Number')
           ylabel('drag force')
           title('clark')
    end
    
end