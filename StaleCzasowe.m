function [ z_t, p_t, k_t ] = StaleCzasowe( K )
% K - transmitancja obiektu
% z_t - stale czasowe zer
% p_t - stale czasowe biegunow
% k_t - wzmocnienie przy zapisie ze stalymi czasowymi

    [z,p,k] = zpkdata(K);
    z_t = -1 ./ z{1};
    p_t = -1 ./ p{1};
    k_t = -k/(prod(z{1}) * prod(p{1})); % tego nie jestem pewien

end

