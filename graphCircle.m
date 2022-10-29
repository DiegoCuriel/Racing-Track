% Autores:
% + Santiago Vera Espinoza - A01641585
% + Carlos Adrián Palmieri Álvarez - A01635776
% + Diego Curiel Castellanos - A01640372
% ---------------------------------------------
% Fecha: 19/11/2021
% ---------------------------------------------
% Descripción: Grafica un circulo dadas las coordenadas y el radio.

function n = graphCircle(x1, y1, r)
    n = 0;

    % Crea la funcion de circunferencia con puntos asignados
    a = @(x) (x - x1).^2 - r.^2;

    % Despeja x y los vuelve funciones independientes igualadas a 0
    y_c1 = @(x) sqrt(-a(x)) + y1;
    y_c2 = @(x) -sqrt(-a(x)) + y1;

    % Grafica las funciones
    fplot(y_c1, [(x1-r) (x1+r)], 'g');
    fplot(y_c2, [(x1-r) (x1+r)], 'g');
end