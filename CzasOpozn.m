function [ t_opozn ] = CzasOpozn( K, epsilon )
   % K - transmitancja, [opcjonalnie] epsilon - dokladnosc jednostki czasu

    if (~exist('epsilon', 'var'))
        epsilon = 0.001;
    end
    
    
    st_ust = StanUst(K); % zakladam ze to jest dokladne 
    wart_stop = st_ust/2; % 50%
    
    % pierwsze przeyblizenie
    [Y,T] = step(K);
    i = 1;
    while true
        if Y(i) > wart_stop
            t_a = T(i-1);
            t_b = T(i);
            break
        end
        i = i+1;
    end

    
    
    %dzielenie na pol
    dt = 0.1;
    while (t_b - t_a) > epsilon
        [Y,T] = step(K, 0:dt:t_b);
        
        %wyszukiwanie od tylu
        i = size(T);
        i = i(1); % i = ostatni element wektora T
        while true
            if Y(i) < wart_stop
                t_a = T(i);
                t_b = T(i+1);
                break
            end
            i = i-1;
        end
        dt = dt/10;
    end
    
    t_opozn = (t_a+t_b)/2;
    
end

