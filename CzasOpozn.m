function [ t_opozn ] = CzasOpozn( Y, T )
   % Y - wektor odp na step T - odpowiadajacy wektor czasu

    st_ust = StanUst(Y);
    
    i = 1;
    wart_stop = st_ust/2; % 50%
    while true
        if Y(i) > wart_stop
            t_opozn = T(i);
            break
        end
        i = i+1;
    end

end

