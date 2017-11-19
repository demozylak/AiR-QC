function [ wsk_nadaz ] = WskNadaz( K_zamk )

    %TODO: increase accuracy
    [MAG,~,~] = bode(K_zamk);
    
    wsk_nadaz = max(MAG);

end

