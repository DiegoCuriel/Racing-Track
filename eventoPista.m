% Autores:
% + Santiago Vera Espinoza - A01641585
% + Carlos Adrián Palmieri Álvarez - A01635776
% + Diego Curiel Castellanos - A01640372
% ---------------------------------------------
% Fecha: 19/11/2021
% ---------------------------------------------
% Descripción: Genera la pista con sus respectivas componentes.

function y = eventoPista()
    m = @(c) 16583 * (25.1*10.^-3) / 10 * c;


    %Puntos de la grafica 1 de España
    x = [m(3), m(6.77), m(2), m(7.15)];
    y = [m(2.23), m(8.69), m(2.23), m(9.15)];
    
    disp("----------------------------------");
    disp("Grafica 1 - España");
    
    hold on;
    
    graphCar(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    
    %Puntos de la grafica 2 de España
    x = [m(24.61), m(25), m(24.4), m(25.2)];
    y = [m(1.77), m(7.23), m(1.8), m(7.1)];
    
    disp("Grafica 2 - España");
    
    hold on;
    
    graphCar(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    
    
    %Puntos de la grafica 1 de Brasil
    x = [m(4.24), m(8.57), m(3.71), m(9)];
    y = [m(10), m(3), m(11), m(2.33)];
    
    disp("----------------------------------");
    disp("Grafica 1 - Brasil");
    
    hold on;
    
    graphCar(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    
    %Puntos de la grafica 2 de Brasil
    x = [m(28.48), m(29.43), m(28), m(29.5)];%28.71
    y = [m(10), m(3), m(11), m(2.33)];
    
    disp("Grafica 2 - Brasil");
    
    hold on;
    
    graphCar(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    
    
    %Puntos de la grafica 1 de Singapore
    x = [m(1.36), m(5.54), m(0.45), m(5.73)];
    y = [m(6), m(0.41), m(7), m(0)];
    
    disp("----------------------------------");
    disp("Grafica 1 - Singapore");
    
    hold on;
    axis equal
    
    graphCar(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    
    %Puntos de la grafica 2 de Singapore
    x = [m(16.73), m(24.02), m(15.82), m(25.32)];
    y = [m(7.68), m(6.73), m(7.82), m(6.64)];
    
    disp("Grafica 2 - Singapore");
    
    hold on;
    axis equal
    xlim([(x(1)-60) (x(2)+60)])

    graphCar(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
end