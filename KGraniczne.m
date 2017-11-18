function [ k ] = KGraniczne( K, k_range )
% K-transmitancja
% k_range - [opcjonalny] wektor wartosci k do sprawdzenia (mozna dac
%   dokladniejszy)

    if (~exist('k_range', 'var'))
        [R,k_w] = rlocus(K);
    else
        [R,k_w] = rlocus(K,k_range);
    end


    i = 1;
    while true
        
        if max(real(R(:,i))) > 0 % szukamy styku dowolnego pierwiastka z osia oY
            k = k_w(i);
            break
        end
        i = i+1;
    end

end

