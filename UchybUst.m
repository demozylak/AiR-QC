function [ e_ust ] = UchybUst( Y , in_step ) 
% uchyb ustalony - Y - wektor odp na step , in_step - amplituda step
    e_ust = StanUst(Y) - in_step;
end

