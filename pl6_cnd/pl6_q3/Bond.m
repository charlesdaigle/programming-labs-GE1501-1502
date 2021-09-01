classdef Bond
    properties
        V_O = 0 ;     % oxygen potential
        V_H = 0 ;     % hydrogen potential
        V_N1 = 0 ;    % nitrogen (1) potential
        V_N2 = 0 ;    % nitrogen (2) potential
    end
    
    properties (Dependent)
       V_total ;      % total potential field
    end
    
    methods
        function total = get.V_total(obj)
           % Gets the total potential field in X-Y plane caused by the bond.
           total = obj.V_O + obj.V_H + obj.V_N1 + obj.V_N2 ; 
        end
    end
end