function pl5_q4
%% INITIAL CONSTANTS
    % initial coordinates in 3d
    PHI_INIT = 0 ;      % deg
    THETA_INIT = 0 ;    % deg
    r_INIT = 8.25 ;     % m
    
    % rates of change of coordinates in 3d
    PHI_RATE = 5.00 ;   % deg/s
    THETA_RATE = 7.50 ; % deg/s
    r_RATE = 0.50 ;     % m
    
    % timeframe
    START_TIME = 0 ;    % s
    STEP_TIME = 0.5 ;   % s
    END_TIME = 25 ;     % s
    t = [START_TIME : STEP_TIME : END_TIME] ;
    
    % exit velocity of water
    v_mag = 18.5 ;      % m/s
    
    % ambient accelerations
    a_x = 0 ;           % m/s^2
    a_y = 0 ;           % m/s^2
    a_z = -9.81 ;       % m/s^2
    
    % camera azimuth/elevation
    AZ = 130 ;
    EL = 50 ;
%% PART A
% CALCULATIONS
    % Calculate arrays stepwise containing values of phi, theta, and r at t from 0s to 25s
    phi = PHI_INIT + PHI_RATE * t ;
    theta = THETA_INIT + THETA_RATE * t ;
    r = r_INIT + r_RATE * t ;
    
    % Convert to rectangular coordinates
    x_i = r .* cosd(theta) .* cosd(phi) ;
    y_i = r .* sind(theta) .* cosd(phi) ;
    z_i = r .* sind(phi) ;
    
% PLOT
    pts = [x_i(end) y_i(end) z_i(end) ; x_i(end) y_i(end) 0] ; % make vertical line to clarify perspective

    figure(1) ;
    hold on ;
    plot3(x_i, y_i, z_i, 'LineStyle', '-', 'LineWidth', 1.5) ;
    line(pts(:,1), pts(:,2), pts(:,3), 'LineStyle', '--', 'color', [0.9 0.4 0.1]) ;
    view(AZ, EL) ;
    grid on ; 
    
    title("Position of Ladder Tip for 25s") ;
    xlabel("x position") ;
    ylabel("y position") ;
    zlabel("z position") ;
    
%% PART B
    % implement position kinematic equation
    position = @(init_position, init_vel, time, accel) init_position + init_vel * time + 0.5 * accel * time.^2 ;
    
    v_0x = v_mag * cosd(theta) .* cosd(phi) ;
    v_0y = v_mag * sind(theta) .* cosd(phi) ;
    v_0z = v_mag * sind(phi) ;

    u = [0 : 0.01 : 5] ;
    figure(2) ;
    hold on ;
    for i=1 : length(t) % length of "t" should match all other arrays of values along path of arm
        x_t = position(x_i(i), v_0x(i), u, a_x) ;
        y_t = position(y_i(i), v_0y(i), u, a_y) ;
        z_t = position(z_i(i), v_0z(i), u, a_z) ;
                  
        z_t = z_t(z_t >= 0) ;
        x_t = x_t(1:length(z_t));
        y_t = y_t(1:length(z_t));
        
        plot3(x_t, y_t, z_t, 'color', [0.1 0.6 0.9]) ;
    end
    view(AZ, EL) ;
    grid on ;
    
    title("Trajectories of Water Flow") ;
    xlabel("x position") ;
    ylabel("y position") ;
    zlabel("z position") ;
end