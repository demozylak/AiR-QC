function [ st_ust ] = StanUst( K )
% K - transmitancja
    %dlugosc wektora
    
    [Y,T] = step(K);
    
    len = size(Y);
    len = len(1);
    
    Tend = 2*T; % w normalnym stepie wartosc sie nie ustala 4some reason
    
    Y = step(K, Tend);
    
    len = size(Y);
    len = len(1);
    
    st_ust = Y(len);
    

end

