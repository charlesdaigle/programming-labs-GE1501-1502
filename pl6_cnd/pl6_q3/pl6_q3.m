function pl6_q3
    %% CONSTANTS
    % PHYSICAL CONSTANTS
    q_e = 1.602e-19 ; % elementary charge
    k = 8.988e9 ;     % Coulomb constant
    A = 0.3e-9 ;      % estimated vertical distance between OHN and NHN bonds
    
    r = [0 : 0.001e-9 : 0.5e-9] ; % in meters [m]
    theta = [0: 1 : 360] ;        % in degrees
    [r, theta] = meshgrid(r, theta) ;
    
    x = r.*cosd(theta) ;
    y = r.*sind(theta) ;
    
    % EQUATIONS
    V = @(q, x_0, y_0) (k*q)./sqrt((x - x_0).^2 + (y - y_0).^2) ;
    
    % O-H-N potentials
    OHN = Bond ;
    OHN.V_O = V(-q_e, 0, A) ;
    OHN.V_H = V(q_e, 0.17e-9, A) ;
    OHN.V_N1 = V(-q_e, 0.28e-9, A) ;
    
    % N-H-N potentials
    NHN = Bond ;
    NHN.V_N1 = V(-q_e, 0, 0) ;
    NHN.V_H = V(q_e, 0.11e-9, 0) ;
    NHN.V_N2 = V(-q_e, 0.3e-9, 0) ;
    
    % O-H-N plot
    figure(1) ;
    mesh(x, y, OHN.V_total) ;
    title("Potential Energy for O-H-N Bond") ;
    xlabel("x [m]") ;
    ylabel("y [m]") ;
    zlabel("Potential [V]") ;
    
    % N-H-N plot
    figure(2) ;
    mesh(x, y, NHN.V_total) ;
    title("Potential Energy for N-H-N Bond") ;
    xlabel("x [m]") ;
    ylabel("y [m]") ;
    zlabel("Potential [V]") ;
    
    % Combined plot
    figure(3) ;
    mesh(x, y, OHN.V_total + NHN.V_total) ;
    title("Potential Energy for O-H-N and N-H-N Bond") ;
    xlabel("x [m]") ;
    ylabel("y [m]") ;
    zlabel("Potential [V]") ;
end