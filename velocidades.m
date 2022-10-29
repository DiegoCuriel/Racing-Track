% Autores:
% + Santiago Vera Espinoza - A01641585
% + Carlos Adrián Palmieri Álvarez - A01635776
% + Diego Curiel Castellanos - A01640372
% ---------------------------------------------
% Fecha: 19/11/2021
% ---------------------------------------------
% Descripción: Funcion que despliega las velocidades en los puntos dados.

function nnum = velocidades(vels, n)

    nnum = 0;

    hold on;
    axis normal;

    ylabel("Metros por segundo");
    xlabel("Número de punto evaluado");

    disp("Velocidad segura a partir de 60 m/s");
    disp("Velocidad de seguridad media a partir de 30 m/s");
    disp("Velocidad peligrosa a partir de 15 m/s");

    safe = @(x) 60 * x ./ x; %Velocidad segura
    mid_safe = @(x) 30 * x ./ x; %Velocidad de seguridad media
    danger = @(x) 15 * x ./ x; %Velocidad peligrosa

    % Grafica las rectas
    fplot(safe, [0, n]);
    fplot(danger, [0, n]);
    fplot(mid_safe, [0, n]);

    % Grafica los puntos con su respectiva velocidad
    for i = 1:n
            plot(i, vels(i), 'o');
    end

    hold off;

end