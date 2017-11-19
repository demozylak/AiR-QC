function [ k ] = KGraniczne( K, epsilon )
% K-transmitancja
% epsilon - [opcjonalny] dokladnosc wzmocnienia 
    if (~exist('epsilon', 'var'))
        k = ZadanyStab(K, 0);
    else
        k = ZadanyStab(K, 0, epsilon);
    end
  
    
end

