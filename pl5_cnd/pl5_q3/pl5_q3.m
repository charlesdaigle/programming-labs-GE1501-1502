function pl5_q3

    function circle_graph(ax, x, y, r, ls, col)
        %% Graphs a circle with radius "r" on axes "ax" at point (x,y) with linestyle "ls" and color "col". 
        angles = 0 : 0.01 : 2*pi ;
        
        xs = r * cos(angles) ;
        ys = r * sin(angles) ; %generate fine arrays of x and y coords on a circle using trig functions
        
        plot(ax, xs + x, ys + y, 'LineStyle', ls, 'LineWidth', 1.5, 'color', col) ;
    end

    WALL_DIST = 8 ;
    CEIL_DIST = 8 ;

    %Arm lengths
    L1 = 4 ;
    L2 = 3 ;
    L3 = 2 ;
    L4 = 1 ;
    
    R1 = L1 * [cosd(60) sind(60)] ; %first arm
    R2 = L2 * [cosd(45) sind(45)] ; %second arm
    
    R12 = R1 + R2 ; %precalculate to cut down on the amount of computations per iteration
    test_angles = [0 30 60 90] ;
    
    figure(1) ;
    ax = axes('Position',[0.1 0.13 0.8 0.8]);
    
    hold on ;
    grid on ;
    axis equal ;
    title('Spatial Positioning of 4-link Robot Arm') ;
    xlabel('Horizontal Distance [ft]') ;
    ylabel('Vertical Distance [ft]') ;
    xline(WALL_DIST, '--');
    yline(CEIL_DIST, '--');
    quiver(ax, 0, 0, R1(1), R1(2), 'LineWidth', 1.3, 'AutoScale', 'off');
    quiver(ax, R1(1), R1(2), R2(1), R2(2), 'LineWidth', 1.3, 'AutoScale', 'off');
    
    colors = [0.9 0.6 0.1 ; 0.1 0.7 0.1 ; 0.5 0.1 0.7 ; 0.2 0.7 0.9] ;
    
    %checking if point at the hinge of the last arm is within 1 of ceiling/wall
    for i = 1 : length(test_angles)
        R3 = L3 * [cosd(test_angles(i)) sind(test_angles(i))] ;
        R123 = R12 + R3 ;
        quiver(ax, R12(1), R12(2), R3(1), R3(2), 'LineWidth', 1.3, 'color', colors(i, :), 'AutoScale', 'off') ;
        circle_graph(ax, R123(1), R123(2), L4, ':', colors(i, :)) ;
        disp(R123) ;
    end
end