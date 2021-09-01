function pl6_q1a
    %% constants
    OXYGEN = 15.9994 ;
    CARBON = 12.001 ;
    NITROGEN = 14.00674 ;
    SULFUR = 32.066 ;
    HYDROGEN = 1.00794 ;
    atom_weights = [OXYGEN, CARBON, NITROGEN, SULFUR, HYDROGEN] ;
    atom_names = ["Oxygen", "Carbon", "Nitrogen", "Sulfur", "Hydrogen"] ;
    atom_nums = [] ;
    
    %% initially prompt user
    txt = sprintf("Please enter the number of atoms of each element in the amino acid.") ;
    disp(txt) ; 
    
    %% get inputs 
    for i=1 : length(atom_names)
        prompt = strcat("   Number of", " ", lower(atom_names(i)), " atoms: ") ;
        atom_nums(i) = input(prompt) ;
    end
    
    %% calculate weight
    weight = dot(atom_nums, atom_weights) ;
    
    %% output weight
    txt = sprintf("The molecular weight of the amino acid is %.4f u.", weight) ;
    disp(txt) ;
    
end