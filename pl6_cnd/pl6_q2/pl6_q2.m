function pl6_q2
    %% CALCULATIONS
    r = [0.05 : 0.05 : 0.5] ;
    theta = [0 : 5 : 360] ;
    
    [r, theta] = meshgrid(r , theta) ;
    
    % polar definition of x and y
    x = r.*cosd(theta) ;
    y = r.*sind(theta) ;
    
    % given constant for parts a, b, and c
    c_ab = 50 ;
    c_c = -50 ;
    
    R = sqrt(x.^2 + y.^2) ; % polar definition of R
    
    f_ab = c_ab./R ; % define our function values
    f_c = c_c./R ; % define our function values
    
    %% PLOTTING
    % PART A
    figure(1) ;
    mesh(x, y, f_ab) ;
    xlabel("X = r*cos(\theta)") ;
    ylabel("Y = r*sin(\theta)") ;
    zlabel("f(r)") ;
    title("f(r) = c/r, c = 50") ;
    
    % PART B
    figure(2) ;
    hold on ;
    grid on ;
    contour(x, y, f_ab) ;
    xlabel("X = r*cos(\theta)") ;
    ylabel("Y = r*sin(\theta)") ;
    title("contour of f(r) = c/r, c = 50") ;
    
    % PART C
    figure(3) ;
    mesh(x, y, f_c) ;
    xlabel("X = r*cos(\theta)") ;
    ylabel("Y = r*sin(\theta)") ;
    zlabel("f(r)") ;
    title("f(r) = c/r, c = -50") ;
    
    figure(4) ;
    hold on ;
    grid on ;
    contour(x, y, f_c) ;
    xlabel("X = r*cos(\theta)") ;
    ylabel("Y = r*sin(\theta)") ;
    title("contour of f(r) = c/r, c = -50") ;
    
end