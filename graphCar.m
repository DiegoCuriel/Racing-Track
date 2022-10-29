% Autores:
% + Santiago Vera Espinoza - A01641585
% + Carlos Adrián Palmieri Álvarez - A01635776
% + Diego Curiel Castellanos - A01640372
% ---------------------------------------------
% Fecha: 19/11/2021
% ---------------------------------------------
% Descripción: Grafica la animación del auto.

function C1 = graphCar(x1, y1, x2, y2, x3, y3, x4, y4)
    m1 = (y3-y1)/(x3-x1);
    m2 = (y4-y2)/(x4-x2);
    
    % Crea la matriz
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
    
    %Crea la función a partir de las incógnitas encontradas.
    y_p = @(x) C3*x.^3 + C2*x.^2 + C1*x + C0;

    %Deriva la función.
    dy_p = @(x) 3*C3*x.^2 + 2*C2*x + C1;

    %Vuelve a derivar la fucnión.
    ddy_p = @(x) 6*C3*x + 2*C2;

    %Función para radio de curvatura: Utiliza la formula para obtener un radio
    %de curvatura dado un punto en x.
    f_r = @(x) sqrt(1+(dy_p(x).^2).^(3/2))./(ddy_p(x));

    per = 30; %Peralte
    r = abs(f_r(x1)); %Radio
    m = 752; %Masa del coche
    cl = 2.58; %Coeficiente aerodinámico
    cd = 1; %Coeficiente de arrastre
    p = 2.225; %Densidad
    A = 1.4; %Area
    cf = 1.6; %Coeficiente de fricción
    vlim = 350/3.6;

    T = 5; %Asigna tracción
   
    b = (1/2)*p*cd*A; %Formula para el arrastre

    %Inicializamos los valores iniciales
    xi = x1;
    yi = y1;

    v = 0;

    D = -b * v^2;

    dt = 1;

    hold on;

    clf

    % Creamos la linea animada
    h = animatedline;
    xlim([x1 x2]);
    axis equal

    tiempoElapsado = 0;

    % Iniciamos el metodo de Euler
    while xi < x2

        tiempoElapsado = tiempoElapsado + dt;

        % Actualizamos todas las variables
        if dy_p(xi)~=0
            o = atan(dy_p(xi));
        else
            o = pi/2;
        end

        r = f_r(xi);

        vxi = v*cos(o);
        vyi = v*sin(o);

        ar = (-D + T) / m;
        ac = (v^2)/r;

        ax = ar*cos(o) - ac*sin(o);
        ay = ar*sin(o) + ac*cos(o);

        vxn = vxi + ax*dt;
        vyn = vyi + ay*dt;

        xn = xi + vxn*dt;
        yn = yi + vyn*dt;

        % Desplegamos los resultados
        fprintf("Posición: (%.2f, %.2f)", xn, yn);
        disp(" ");
        fprintf("Velocidad: (%.2f i) + (%.2f j)", vxn, vyn);
        disp(" ");
        fprintf("Aceleración: (%.2f i) + (%.2f j)", ax, ay);
        disp(" ");
        fprintf("Tiempo: %.2f s", tiempoElapsado);
        disp(" ");

        % Anima la linea
        addpoints(h, xn, yn);
        drawnow;

        % Actualiza valores base
        xi = xn;
        yi = yn;
        v = sqrt(vxn^2 + vyn^2);

        % Pause a la consola
        pause(0.001);

    end

    hold off;

end


