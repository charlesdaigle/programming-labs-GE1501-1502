function pl5_q1
    % Curve fitting data with second-order polynomial
    
    % Speeds of car
    v = [5 : 10 : 75] ;
    v_fine = [5 : 0.1 : 75] ; %use finer speeds for higher resolution graph
    
    % Fuel efficiencies at those speeds
    F_E = [11 22 28 29.5 30 30 27 23] ;
    
    % Speed to be used in estimation
    estim_speed = 60 ;
    
    function plot_polyfit(x, y, degree, fig)
        p = polyfit(x, y, degree) ; %fit polynomial to data of given degree
        p_estims = polyval(p, v_fine) ; %use finer speeds to estimate

        % Plotting
        figure(fig) ;
        hold on ;
        grid on ;
        
        plot(x, y, 'o') ; %plot the given data
        plot(v_fine, p_estims, 'LineWidth', 1.5) ; %plot nth degree polynomial estimation
        
        estim_point = [estim_speed polyval(p, estim_speed)] ; %estimate at v=60
        
        plot(estim_point(1), estim_point(2), '*', 'MarkerSize', 10) ; %estimate the value at v=60
        point_label = sprintf('v = %0.2f mi/h\nF_E = %0.2f mpg', estim_point(1), estim_point(2)) ;
        text(estim_point(1)+1, estim_point(2)+2, point_label) ;
        xline(estim_speed, '--', 'color', [0.1 0.5 0.1]) ;
        yline(polyval(p, estim_speed), '--', 'color', [0.1 0.5 0.1]) ; %create intersecting lines at eval point

        xlabel('Speed [mi/h]') ;
        ylabel('Fuel efficiency [mpg]') ;
        title(['Fuel Efficiency vs. Speed (degree=', num2str(degree), ')']) ;
    end

    %% PLOTTING
    % Call the function twice for both degrees of polynomial estimation
    plot_polyfit(v, F_E, 2, 1) ;
    plot_polyfit(v, F_E, 3, 2) ;
end