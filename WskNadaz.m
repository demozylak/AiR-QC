function [ wsk_nadaz ] = WskNadaz( K_zamk )

    [MAG,~,~] = bode(K_zamk);
    
    wsk_nadaz = max(MAG);

end

