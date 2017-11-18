function [ ret ] = QualityControl( K_otw , T )
%QualityControl liczy wskazniki jakosci dla
%  Input args:
%    K_otw - transmitancja uk³adu otwartego
%    T - wektor czasu do sprawdzenia (opcjonalny)
%  Returns:
%    st_ust - stan ustalony
%    e_ust - uchyb w stanie ustalonym
%    K_zamk - transmitancja ukl zamk po ujemn sprzez zwrot



    %obliczenie transmitancji ukladu zamknietego
    K_zamk = K_otw/(1+K_otw);
    ret.K_zamk = K_zamk;

    %wektor odpowiedzi dla dalszych obliczen
    if (~exist('T', 'var'))
        [Y,T] = step(K_zamk);
    else
        [Y,T] = step(K_zamk,T);
    end

    
    %stan ustalony
    ret.st_ust = StanUst(Y);
    
    %uchyb ust
    ret.e_ust = UchybUst(Y, 1);
    
    %czas opoznienia 
    ret.t_opozn = CzasOpozn(Y,T);
    
    
    si = stepinfo(K_zamk);
    
    %maks przeregulwanie
    ret.maks_przegeg = si.Overshoot;
    %czas narastania
    ret.t_narast = si.RiseTime;
    %czas regulacji
    ret.t_reg = si.SettlingTime;
    
    
    
    %zapas fazy i amplitudy
    [Gm,Pm,~,~] = margin(K_otw);
    
    ret.zapas_fazy = Pm;
    ret.zapas_amplitudy = Gm;
    
    
    %wskaznik nadazania M(w)
    ret.wsk_nadaz = WskNadaz(K_zamk);
    
    %wskazniki pierwiastkowe
    [st_stab, st_osc] = WskPierwiastkowe(rlocus(K_otw, 1));
    ret.st_stab = st_stab;
    ret.st_osc = st_osc;
    
end

