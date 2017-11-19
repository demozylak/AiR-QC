function [ st_stab, st_osc ] = WskPierwiastkowe( K )
% K - transmitancja ( po wzmocnieniu czy cos)
    R = rlocus(K,1);
    st_stab = min(abs(real(R)));
    st_osc = max(imag(R)./real(R));
end

