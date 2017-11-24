function [ k ] = ZadanyOsc( K_otw, st_osc, epsilon )
%zwraca wzmocnienie takie aby uklad mial zadany stopien oscylacyjnosci
% opcjonalnie: epsilon - dokladnosc wzmocnienia

    if (~exist('epsilon', 'var'))
        epsilon = 0.001;
    end
    
    % pierwsze przyblizenie
    [R,k_w] = rlocus(K_otw);
    i = 1;
    while true
        st = max(imag(R(:,i))./real(R(:,i))); % stopien oscylacyjnosci
        if st > st_osc
            k_a = k_w(i-1);
            k_b = k_w(i);
            break
        end
        i = i+1;
    end
    
    
    %dzielenie przedzialu
    while (k_b - k_a) > epsilon
        srodek = (k_a + k_b)/2;
        R = rlocus(K_otw, srodek);
        
        st = max(imag(R)./real(R));
        if st > st_osc %wartosc szukana jest w lewej czesci
            k_b = srodek;
        else %wartosc szukana jest w prawej czesci
            k_a = srodek;
        end
    end
    
    k = (k_a + k_b)/2; % TODO: ta srednia nie zwieksza dokladnosci


end

