function [ st_ust ] = StanUst( Y )
% Y - wektor odpowiedzi (musi sie ustalac) ( moze byc ze stepa)
    
    %dlugosc wektora
    len = size(Y);
    len = len(1);
    
    st_ust = Y(len);
    

end

