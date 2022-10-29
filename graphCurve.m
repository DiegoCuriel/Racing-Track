% Autores:
% + Santiago Vera Espinoza - A01641585
% + Carlos Adrián Palmieri Álvarez - A01635776
% + Diego Curiel Castellanos - A01640372
% ---------------------------------------------
% Fecha: 19/11/2021
% ---------------------------------------------
% Descripción: Grafica las curvas con las gradas, las tangentes, los radios
% de curvatura e imprime los puntos criticos.

function [vels, n] = graphCurve(x1, y1, x2, y2, x3, y3, x4, y4)
    m1 = (y3-y1)/(x3-x1);
    m2 = (y4-y2)/(x4-x2);
    
    %Grafica las lineas entre los puntos y diversas simbologías
    plot(x1, y1, 'o'); hold on; text(x1,y1, "(x_1,y_1)");
    plot(x2, y2, 'o'); text(x2,y2, "(x_2,y_2)");
    plot([x1,x3],[y1,y3]); text(x3-0.5, y3-0.5, "dx/dy_1");
    plot([x2,x4],[y2,y4]); text(x4-0.5, y4-0.5, "dx/dy_2");
    
    % Crear matriz
    M = [x1^3, x1^2, x1, 1;
         x2^3, x2^2, x2, 1;
         3*x1^2, 2*x1, 1, 0;
         3*x2^2, 2*x2, 1, 0];
    
    R = [y1; y2; m1; m2];
    
    det(M);
    %Resuelve una matriz de 4 incógnitas.
    
    M1 = M;
    M1(:,1) = R;
    
    C3 = det(M1)/det(M);
    
    M1 = M;
    M1(:,2) = R;
    
    C2 = det(M1)/det(M);
    
    M1 = M;
    M1(:,3) = R;
    
    C1 = det(M1)/det(M);
    
    M1 = M;
    M1(:,4) = R;
    
    C0 = det(M1)/det(M);
    % Despues de encontrar los coeficientes los desplegamos
    disp("Coeficientes: ");
    fprintf("A0: %.2f", C0);
    disp(" ");
    fprintf("A1: %.2f", C1);
    disp(" ");
    fprintf("A2: %.2f", C2);
    disp(" ");
    fprintf("A3: %.2f", C3);
    disp(" ");
    disp(" ");
    
    %Crea la función a partir de las incógnitas encontradas.
    y_p = @(x) C3*x.^3 + C2*x.^2 + C1*x + C0;

    fplot(y_p, [x1, x2]);

    %Deriva la función.
    dy_p = @(x) 3*C3*x.^2 + 2*C2*x + C1;

    %Vuelve a derivar la fucnión.
    ddy_p = @(x) 6*C3*x + 2*C2;

    %Función para radio de curvatura: Utiliza la formula para obtener un radio
    %de curvatura dado un punto en x.
    f_r = @(x) sqrt(1+(dy_p(x).^2).^(3/2))./(ddy_p(x));
    
    % Elementos de calculo de la funcion cuadratica para puntos maximos y
    % minimos
    a = 3*C3;
    b = 2*C2;
    c = C1;
    
    % Demostramos que la curva pasa por el punto inicial y final
    disp("Demostración de que la curva pasa por Pi y Pf: ");
    disp("Pi:");
    fprintf("El punto x (%.2f) se evalua en la función (%.2f)x^3 + (%.2f)x^2" + ...
        "+ (%.2f)x + (%.2f).", x1, C3, C2, C1, C0);
    disp(" ");
    fprintf("La 'y' original es igual a %.2f, la evaluada es igual a %.2f", y1, y_p(x1));
    disp(" ");
    disp("---------------------------------");
    disp("Pf:");
    fprintf("El punto x (%.2f) se evalua en la función (%.2f)x^3 + (%.2f)x^2" + ...
        "+ (%.2f)x + (%.2f).", x2, C3, C2, C1, C0);
    disp(" ");
    fprintf("La 'y' original es igual a %.2f, la evaluada es igual a %.2f", y2, y_p(x2));
    disp(" ");
    disp(" ");
    
    % Funcion para la integral de la longitud curva
    dy_eval = @(x) sqrt(1 + dy_p(x).^2);
    inter = integral(dy_eval, x1, x2);
    fprintf("La longitud de la curva es de %.2f m.", inter);
    disp(" ");
    disp(" ");

    % Encontrar maximos y minimos
    raiz = b.^2-4.*a.*c;

    if raiz >=0
        tpx(1) = (-b+sqrt(raiz))/(2.*a);
        tpx(2) = (-b-sqrt(raiz))/(2.*a);

        y = zeros(1,2);

        tpy(1) = y_p(tpx(1));
        tpy(2) = y_p(tpx(2));
    
        % Comprobamos que la raiz no sea negativa para no trabajar con
        % imaginarios
        if ddy_p(tpx(1)) < 0
            fprintf("Máximo: (%.4f, %.4f)", tpx(1), tpy(1));
            disp(" ");
            fprintf("Mínimo: (%.4f, %.4f)", tpx(2), tpy(2));

            r1 = abs(f_r(tpx(1)));
            
            % Graficamos los circulos de radio
            graphCircle(tpx(1), tpy(1) - r1, 5);
            graphCircle(tpx(2), tpy(2) + r1, r1);

        else
            fprintf("Máximo: (%.4f, %.4f)", tpx(2), tpy(2));
            disp(" ");
            fprintf("Mínimo: (%.4f, %.4f)", tpx(1), tpy(1));

            r1 = abs(f_r(tpx(1)));

            graphCircle(tpx(1), tpy(1) + r1, r1);
            graphCircle(tpx(2), tpy(2) - r1, r1);
        end
        disp(" ");
        disp(" ");
    else
        disp("No hay máximos ni minimos.")
        disp(" ");
        disp(" ");
    end

    % Paso en 20
    n = round((inter)/20);

    x_c = linspace(x1, x2, n);

    %Variable de velocidades
    vels = zeros(1, n);

    inzone = 0;

    % Iteramos por todos los valores de n
    for i = 1:n

        y_c = y_p(x_c(i));

        m_c = dy_p(x_c(i));

        %Ecuación de la función
        y_e = @(x) m_c*x - m_c*x_c(i) + y_c;

        %Encontramos el radio de curvatura
        r_c = f_r(x_c(i));

        x_f = x_c(i) + 60;

        %y_f = y_e(x_f);

        per = 30; %Peralte
        o = deg2rad(per); %Theta, ángulo en radianes
        r = abs(r_c); %Radio
        m = 752; %Masa del coche
        cl = 2.58; %Coeficiente aerodinámico
        p = 2.225; %Densidad
        A = 1.4; %Area
        cf = 1.6; %Coeficiente de fricción
        vlim = 350/3.6;

        %Encontramos la velocidad máxima
        trig = (cf*cos(o)+sin(o))/(-cf*sin(o)+cos(o));

        ind1 = trig/(2 * m + r * p * A * cl * sin(o));

        num = 2 * m * 9.81 * ind1 * r;
        div = 1 - (r * ind1 * p * A * cl * cos(o));

        V = (num/div);

        %Comprueba que V no sea negativo
        if (V<0)
            V = vlim; 
        else
            V = V .^ 0.5;
            if V > vlim
                V = vlim;
            end
        end

        vels(i) = V;

        % Despliega las velocidades maximas
        fprintf("Velocidad máxima punto %.0f:", i);
        fprintf("m/s: %.4f, km/h: %.4f", V, V*3.6);
        disp(" ");
        fprintf("Radio de curvatura punto %.0f: %.4f m", i, r);
        disp(" ");
        disp(" ");

        %Plotea el punto y su curva.
        plot(x_c(i), y_c, 'x');
        fplot(y_e, [x_c(i), x_f]);

        if(raiz >= 0)
            plot(tpx(1), y_p(tpx(1)), 'o');
            plot(tpx(2), y_p(tpx(2)), 'o');
        end

        % Crea una ariable temporal para la x actual
        xtemp = x_c(i);

        % Comprueba que el radio sea menor a 100
        if r < 100
            
            if inzone < 1
                fprintf("Empieza la zona crítica en (%.2f, %.2f)", xtemp, y_p(xtemp));
                disp(" ");
                disp(" ");
            end

            inzone = inzone + 1;

            r_temp = abs(f_r(xtemp));
            
            % Se ejecuta mientras r sea menor a 100
            while r_temp < 100
                if i < n
                    if xtemp + cos(atan(dy_p(xtemp))) > x_c(i + 1)
                        break;
                    end
                elseif xtemp > x2
                    fprintf("Termina la zona crítica en (%.2f, %.2f)", xtemp, y_p(xtemp));
                    disp(" ");
                    disp(" ");

                    inzone = 0;
                    break;
                end

                % Despliega los puntos de zona critica
                plot(xtemp, y_p(xtemp), 'x');

                xtemp = xtemp + cos(atan(dy_p(xtemp)));
                r_temp = abs(f_r(xtemp));
            end
            
            % Verifica que termine la zona critica
            if r_temp >= 100
                fprintf("Termina la zona crítica en (%.2f, %.2f)", xtemp, y_p(xtemp));
                disp(" ");
                disp(" ");

                inzone = 0;
            end

        end

    end
    hold off;
end


