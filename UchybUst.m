function [ e_ust ] = UchybUst( K , in_step ) 
% uchyb ustalony - K - transmitancja , 
% [opcjonalnie domyzlnie =1]in_step - amplituda step

    if (~exist('in_step', 'var'))
        in_step = 1;
    else

    
    e_ust = StanUst(K) - in_step;
end

