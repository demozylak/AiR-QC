function [ k ] = ZadanyStab( K_otw, st_stab, epsilon )
%zwraca wzmocnienie takie aby uklad mial zadany stopien stabilnosci
% opcjonalnie: epsilon - dokladnosc wzmocnienia
    
    
    if (~exist('epsilon', 'var'))
        epsilon = 0.001;
    end
    
    % pierwsze przyblizenie
    [R,k_w] = rlocus(K_otw);
    
    
    i = 1;
    while true
        st  = -max(real(R(:,i)));
        
        if st < st_stab
            try 
                k_a = k_w(i-1);
                k_b = k_w(i);
            catch ME % przeszukano wszystkie wartosci i st_stab nigdy nie byl wystarczajaco wysoki
                msgID = 'ZadanyStab:Noniedzialano';
                msg = sprintf('Ten system nie moze byc az tak stabilny st_stab=%f>n_maks', st_stab);
                baseException = MException(msgID,msg);
                throw(baseException)
            end
            break
        end
        i = i+1;
    end
    
    
    %dzielenie przedzialu
    while (k_b - k_a) > epsilon
        srodek = (k_a + k_b)/2;
        R = rlocus(K_otw, srodek);
        
        st  = -max(real(R));
        if st < st_stab %wartosc szukana jest w lewej czesci
            k_b = srodek;
        else %wartosc szukana jest w prawej czesci
            k_a = srodek;
        end
    end
    
    k = (k_a + k_b)/2; % TODO: ta srednia nie zwieksza dokladnosci


end

