function pl4_q3
    % Resistor values (ohms)
    R1 = 4 ;
    R2 = 4 ;
    R3 = 6 ;
    R4 = 4 ;
    R5 = 2 ;
    R6 = 3 ;
    R7 = 2.5 ;
    
    % Voltage sources (volts)
    V1 = 18 ;
    V2 = 18 ;
    V3 = 12 ;
    V4 = 28 ;
    
    % Given Kirchoff's Voltage Law loops
    syms i1 i2 i3 i4 ; % Use symbols as placeholder variables
    loop1 = i1*R1 + (i1-i2)*R2 + (i1-i3)*R4 - V1 == 0 ;
    loop2 = (i2-i1)*R2 + i2*R3 + (i2-i4)*R5 + V2 == 0 ;
    loop3 = (i3-i1)*R4 + (i3-i4)*R6 - V3 == 0 ;
    loop4 = (i4-i3)*R6 + (i4-i2)*R5 + i4*R7 + V4 == 0 ;
    
    % convert the given equations to a matrix with the current values
    [A,B] = equationsToMatrix([loop1, loop2, loop3, loop4], [i1, i2, i3, i4]) ;
    
    % find RREF and extract the rightmost column (solve system)
    currents = linsolve(A,B) ;
    
    % pretty-print all currents
    for i=1 : length(currents)
        fprintf("i%i = %0.3f A\n", i, currents(i)) ;
    end
    
end