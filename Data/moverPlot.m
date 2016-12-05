function  moverPlot( )
    close all
    clear all
    
    % Konstanten
    rad = pi/180;
    
    % Startbedingung
    maxAngle = 60;
    minAngle = 30;
    randVal = rand(1);
    startAngle = randVal*(maxAngle-minAngle) + minAngle;
    X = 0:0.001:10;
    
    % Formel Fahrtvektor
    Y = tan(startAngle*rad) * X;
    figure(1);
    plot (X,Y);
    axis([0,10,0,10]);     
    hold on;
    maxAngle = 60;
    minAngle = -60;
    
    % flags voriger Zustand
    oben = 0;
    unten = 0;
    rechts = 0;
    links = 0;
       
    
    for i = 1:1:10
        randVal = rand(1);
        newAngle = randVal*(maxAngle-minAngle) + minAngle;
        if  Y(end) < 10  && rechts == 0
            X = 0:0.001:10;
            Y = (tan(newAngle*rad) *(X-10)) + Y(end);
            plot (X,Y);
            oben = 0;
            unten = 0;
            rechts = 1;
            links = 0;
        elseif Y(end) > 10 && oben == 0
            k = find(Y>10,1);
            NX = X(k);
            X = 0:0.001:10;
            Y = (tan(newAngle*rad) *(X-NX)) + 10;
            plot (X,Y);
            oben = 1;
            unten = 0;
            rechts = 0;
            links = 0;
        elseif Y(1)<= 0 && unten == 0
            k = find(Y>0,1);
            NX = X(k);
            X = 0:0.001:10;
            Y = (tan(newAngle*rad) *(X-NX));
            plot (X,Y);
            oben = 0;
            unten = 1;
            rechts = 0;
            links = 0;
        elseif X(1) <=0 && links == 0
            k = find(X>0,1);
            NY = Y(k);
            X = 0:0.001:10;
            Y = (tan(newAngle*rad) *X) + NY;
            plot (X,Y);
            oben = 0;
            unten = 0;
            rechts = 0;
            links = 1;
        end 
    end
end
