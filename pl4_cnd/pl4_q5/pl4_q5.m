function pl4_q5
    % Used pencil and paper to derive polynomial with these coefficients in
    % standard form:
    V_cone = pi * [-1/3 -3 27 243] ;

    % Plot over a range of h values
    h_vals = [-9 : 0.1: 9] ;
    figure(1) ;
    plot(h_vals, polyval(V_cone, h_vals), 'LineWidth', 1.5, 'Color', [0.5 0.1 0.5]) ;
    xlabel('Distance between cone base and sphere center [in]') ;
    ylabel('Volume of cone [in^3]') ;
    title('Volume of inscribed cone vs. base-center distance') ;
    grid() ;

    % When volume of cone is 500, subtract from constant term
    V_500 = cat(2, V_cone(1:3), V_cone(4)-500) ;
    V_500_roots = roots(V_500) ; %find roots of polynomial
    V_500_roots = V_500_roots(V_500_roots >= -9 & V_500_roots <= 9) ; %limit to positive volumes only
    
    % pretty-print outputs
    fprintf("Values of ''h'' from [-9,9] for V = 500 : \n") ;
    for i = 1 : length(V_500_roots)
       fprintf("\th = %0.2f\n", V_500_roots(i)) ; 
    end
    
    % use polynomial coefficients to create a symbolic polynomial, then use it as a function
    syms h ;
    V_poly = poly2sym(V_cone, h) ; 
    V = matlabFunction(V_poly) ;
    
    % MATLAB does not implement a "max" function so negate function V
    V_neg = @(h) -V(h) ;
    
    % Find maxima near 0 (middle of the range [-9,9])
    [h, V_neg_of_h] = fminunc(V_neg, 0, optimoptions('fminunc','Display','none')) ;
    
    fprintf("Volume maximized at h = %0.2f, V(h) = %0.2f \n", h, V_neg_of_h) ;
    
end
