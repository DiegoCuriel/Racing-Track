% Autores:
% + Santiago Vera Espinoza - A01641585
% + Carlos Adrián Palmieri Álvarez - A01635776
% + Diego Curiel Castellanos - A01640372
% ---------------------------------------------
% Fecha: 19/11/2021
% ---------------------------------------------
% Descripción: Graficas las curvas con sus respectivas gradas.

function y = eventoGradas()
    m = @(c) 16583 * (25.1*10.^-3) / 10 * c;


    %Puntos de la grafica 1 de España
    x = [m(3), m(6.77), m(2), m(7.15)];
    y = [m(2.23), m(8.69), m(2.23), m(9.15)];
    
    disp("----------------------------------");
    disp("Grafica 1 - España");
    
    hold on;
    axis equal
    
    gradas(x(1)+20, y(1)+60, 64);
    gradas(x(2)-30, y(2)-100, 64);
    [vels, n] = graphCurve(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    axis normal
    xlim([0 n]);
    velocidades(vels, n);
    figure;
    
    %Puntos de la grafica 2 de España
    x = [m(24.61), m(25), m(24.4), m(25.2)];
    y = [m(1.77), m(7.23), m(1.8), m(7.1)];
    
    disp("Grafica 2 - España");
    
    hold on;
    axis equal
    ylim([(y(1) - 30) (y(2) + 60)])
    
    gradas(x(1)-25, y(1)+60, 87);
    gradas(x(2)+10, y(2)-120, 87);
    [vels, n] = graphCurve(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    axis normal
    xlim([0 n]);
    velocidades(vels, n);
    figure;
    
    
    %Puntos de la grafica 1 de Brasil
    x = [m(4.24), m(8.57), m(3.71), m(9)];
    y = [m(10), m(3), m(11), m(2.33)];
    
    disp("----------------------------------");
    disp("Grafica 1 - Brasil");
    
    hold on;
    axis equal
    
    gradas(x(1)+90, y(1)-110, 120);
    gradas(x(1)+160, y(1)-218, 122);
    [vels, n] = graphCurve(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    axis normal
    xlim([0 n]);
    velocidades(vels, n);
    figure;
    
    %Puntos de la grafica 2 de Brasil
    x = [m(28.48), m(29.43), m(28), m(29.5)];%28.71
    y = [m(10), m(3), m(11), m(2.33)];
    
    disp("Grafica 2 - Brasil");
    
    hold on;
    axis equal
    
    gradas(x(1)-15, y(1)-110, 100);
    gradas(x(1), y(1)-240, 95);
    [vels, n] = graphCurve(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    axis normal
    xlim([0 n]);
    velocidades(vels, n);
    figure;
    
    
    %Puntos de la grafica 1 de Singapore
    x = [m(1.36), m(5.54), m(0.45), m(5.73)];
    y = [m(6), m(0.41), m(7), m(0)];
    
    disp("----------------------------------");
    disp("Grafica 1 - Singapore");
    
    hold on;
    axis equal
    
    gradas(x(1)+60, y(1)-110, 135);
    gradas(x(1)+130, y(1)-220, 120);
    [vels, n] = graphCurve(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    axis normal
    xlim([0 n]);
    velocidades(vels, n);
    figure;
    
    %Puntos de la grafica 2 de Singapore
    x = [m(16.73), m(24.02), m(15.82), m(25.32)];
    y = [m(7.68), m(6.73), m(7.82), m(6.64)];
    
    disp("Grafica 2 - Singapore");
    
    hold on;
    axis equal
    xlim([(x(1)-60) (x(2)+60)])
    
    gradas(x(1)+50, y(1)+24, -8);
    gradas(x(1)+200, y(1)+4, -7);
    [vels, n] = graphCurve(x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4));
    
    figure;
    axis normal
    xlim([0 n]);
    velocidades(vels, n);
    figure;
end