function pl4_q4
    % given function of Lc
    Lc = @(L0, D, Q) L0 ./ (1 + 2.5*D.^(2/3)./sqrt(Q)) ;
    
    % given values of influent BOD (L0)
    infBODs = [5 10 20] ;
    
    % generate some values for the depth
    depthMin = 100 ;
    depthStepSize = 5 ;
    depthMax = 2000 ;
    depth = [depthMin : depthStepSize : depthMax] ;
    
    % flow rate (given constant)
    flowRate = 300 ;
    
    % define a new function with given inputs
    LcConstants = @(L0) Lc(L0, depth, flowRate) ;
    
    % apply LcConstants to each of the three infBODs (L0)
    effBODs = [] ;
    
    for i=1 : length(infBODs)
        % use cells to allow use of arrayfun, convert back to matrix
       effBODs{i} = cell2mat(arrayfun(LcConstants, infBODs(i), 'UniformOutput', false)) ;
    end
    
    % plot all three depth effBODs on the same figure
    figure(1); 
    hold on ; %same figure
    grid on ;
    plot(depth, effBODs{1}, '-', 'LineWidth', 1.5) ;
    plot(depth, effBODs{2}, '-', 'LineWidth', 1.5) ;
    plot(depth, effBODs{3}, '-', 'LineWidth', 1.5) ;
    
    xlabel('Depth of Filter [m]') ;
    ylabel('Effluent Biological Oxygen Demand (BOD) [mg/L]') ;
    title('Effluent BOD vs. Depth of Filter');
    
    legend('L_0 = 5 mg/L', 'L_0 = 10 mg/L', 'L_0 = 20 mg/L') ;
    
    % Our criteria for "flat" is the first depth of the filter where the
    % effluent BOD decreases by a maximum of 0.15 mg/L by the time the
    % depth reaches 2000m.
    % 5 mg/L  :  850 m
    % 10 mg/L : 1235 m
    % 20 mg/L : 1545 m
end