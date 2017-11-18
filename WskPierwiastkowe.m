function [ st_stab, st_osc ] = WskPierwiastkowe( R )
% R - roots z rlocusa
    st_stab = min(abs(real(R)));
    st_osc = max(imag(R)./real(R));
end

