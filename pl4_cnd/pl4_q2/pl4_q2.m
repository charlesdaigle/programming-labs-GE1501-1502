function pl4_q2
    
    f = @(n) 2^n / factorial(n) ; %assign function to the name "f"

    n_a = [0 : 1 : 5] ;     %first 5 values of n
    n_b = [0 : 1 : 10] ;    %first 10 values of n
    n_c = [0 : 1 : 50] ;    %first 50 values of n

    series_a = arrayfun(f, n_a) ; %calculate terms in series given each range of n
    series_b = arrayfun(f, n_b) ;
    series_c = arrayfun(f, n_c) ;

    sum_series_a = sum(series_a) ; %sum terms in all series
    sum_series_b = sum(series_b) ;
    sum_series_c = sum(series_c) ;

    %% Output 
    fprintf('sum of series from n=1 to n=5:  %f\n', sum_series_a) ;
    fprintf('sum of series from n=1 to n=10: %f\n', sum_series_b) ;
    fprintf('sum of series from n=1 to n=50: %f\n', sum_series_c) ;
    fprintf('true value of e^2:              %f\n', exp(2)) ;

end
