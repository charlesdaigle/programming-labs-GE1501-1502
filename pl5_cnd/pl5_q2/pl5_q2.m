function pl5_q2
    % all given data
    V = [0.75 : -0.1 : 0.35] ;       %volume [L]
    T_C = [25 37 45 56 65] ;         %temp [C]
    T_K = T_C + 273.15 ;             %[C --> K]
    P = [1.63 1.96 2.37 3.00 3.96] ; %pressure [atm]
    n = 0.05 ;                       %amt of gas [mol]

    T_P_ratio = T_K ./ P ;           %create our X-axis

    line = polyfit(T_P_ratio, V, 1) ; %fit a line to the data
    line_estims = polyval(line, T_P_ratio) ; %create graphable line
    nR = line(1) ; %get the slope from the line
    R = nR / n ; % find the slope (rise/run)

    % Plotting
    figure(1) ;
    hold on ;
    grid on ;

    plot(T_P_ratio, V, 'o') ; %plot the given data
    plot(T_P_ratio, line_estims, '-') ; %plot nth degree polynomial estimation
    title('Volume vs. Temperature-Pressure Ratio') ;
    xlabel('Temperature / Pressure [K/atm]') ;
    ylabel('Volume [L]') ;
    label = sprintf('slope = nR = %0.5f\nn = 0.05, R = nR / n = %0.4f', nR, R) ;
    text(T_P_ratio(3) - 30, V(3) + 0.1, label) ; %position the text above the line
    
end