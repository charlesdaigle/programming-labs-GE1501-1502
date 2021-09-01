% Note: I feel like the idea of this exercise is to somehow repurpose the
% code from part A -- I didn't do this because it is subtly different in a
% way that I feel warrants re-writing the code. In part A, the input method is
% different than in B -- not user-determined but data-driven.

function pl6_q1b
    % constants
    OXYGEN = 15.9994 ;
    CARBON = 12.001 ;
    NITROGEN = 14.00674 ;
    SULFUR = 32.066 ;
    HYDROGEN = 1.00794 ;
    atom_weights = [OXYGEN, CARBON, NITROGEN, SULFUR, HYDROGEN] ;
    
    % import data
    amino_atom_nums = importdata("elements.dat") ;
    
    % matrix multiplication to find the weights
    amino_acid_weights = amino_atom_nums * atom_weights.' ;
    
    % write to a file
    fileID = fopen('weights.dat', 'w') ;
    fprintf(fileID, '%.6f\n', amino_acid_weights) ;
    
end