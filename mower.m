function  mower( )
    close all
    clear all
    %Startbedingung
    maxAngle = 60;
    minAngle = 30;
    % Ermittlung zufälliger Winkel
    randVal = rand(1);
    startAngle = randVal*(maxAngle-minAngle) + minAngle;
    
    X = 0:0.001:10;
    % Formel Fahrtvektor
    Y = tan(startAngle*pi/180) * X;
    figure(1);
    plot (X,Y);
    axis([0,10,0,10]);     
    %axis([-5,15,-5,15])
    hold on;
    % Winkelbedingung
    maxAngle = 60;
    minAngle = -60;
    
    %flags voriger Zustand
    oben = 0;
    unten = 0;
    rechts = 0;
    links = 0;
       
    
    for i = 1:1:10
        % Ermittlung zufälliger Winkel
        randVal = rand(1);
        newAngle = randVal*(maxAngle-minAngle) + minAngle;
        if  Y(end) < 10 && Y(end)>0 && rechts == 0
            X = 0:0.001:10;
            Y = (tan(newAngle*pi/180) *(X-10)) + Y(end);
            plot (X,Y);
            oben = 0;
            unten = 0;
            rechts = 1;
            links = 0;
        elseif (Y(end) > 10 || Y(1) > 10) && oben == 0
            % Errmittlung des Schnittpunkts mit dem Rand
            k = find(Y>10);
            if Y(k(end)) > Y(k(1))
                NX = X(k(1));
            else
                NX = X(k(end));
            end
            
            X = 0:0.001:10;
            Y = (tan(newAngle*pi/180) *(X-NX)) + 10;
            plot (X,Y);
            oben = 1;
            unten = 0;
            rechts = 0;
            links = 0;
        elseif (Y(1)<= 0 || Y(end) <= 0) && unten == 0
            % Errmittlung des Schnittpunkts mit dem Rand
            k = find(Y<0);
             if Y(k(end)) < Y(k(1))
                NX = X(k(1));
            else
                NX = X(k(end));
            end
            
            X = 0:0.001:10;
            Y = tan(newAngle*pi/180) *(X-NX);
            plot (X,Y);
            oben = 0;
            unten = 1;
            rechts = 0;
            links = 0;
        elseif X(1) <=0 && X(1)< 10 && links == 0
            NY = Y(1);
            X = 0:0.001:10;
            Y = (tan(newAngle*pi/180) *X) + NY;
            plot (X,Y);
            oben = 0;
            unten = 0;
            rechts = 0;
            links = 1;
        end
        
    end
        
    
    
end

