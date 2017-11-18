function [ k ] = ZadanyStab( K_otw, st_stab, k_range )
%zwraca wzmocnienie takie aby uklad mial zadany stopien stabilnosci
% opcjonalnie: k_range - wektor wzmocnien k do sprawdzenia (mozna dac dokladniejszy np )

    
    if (~exist('k_range', 'var'))
        [R,k_w] = rlocus(K_otw);
    else
        [R,k_w] = step(K_otw, k_range);
    end
    
    i = 1;
    while true
        [ st, ~ ] = WskPierwiastkowe( R(:,i) );
        if st < st_stab
            k = k_w(i);
            break
        end
        i = i+1;
    end

end

