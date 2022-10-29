% Autores:
% + Santiago Vera Espinoza - A01641585
% + Carlos Adrián Palmieri Álvarez - A01635776
% + Diego Curiel Castellanos - A01640372
% ---------------------------------------------
% Fecha: 19/11/2021
% ---------------------------------------------
% Descripción: Se grafican las gradas dadas las coordenadas y el angulo.

function res = gradas(xld,yld,angulo)

    % Convierte el angulo a radianes
    angulo = deg2rad(angulo);

    dAD = sqrt((80^2)+(10^2));
    angD = angulo-atan(1/8);

    % Encuentra los puntos del poligono con reglas trigonometricas
    xrd = xld + 80 * cos(angulo);
    yrd = yld + 80 * sin(angulo);

    xlu = xld + 10 * sin(angulo);
    ylu = yld - 10 * cos(angulo);

    xru = xld + dAD*cos(angD);
    yru = yld + dAD*sin(angD);

    % Creamos un poligono con las coordenadas
    pgon = polyshape([xlu xld xrd xru],[ylu yld yrd yru]);
    plot(pgon);
    
    res = 0;
end