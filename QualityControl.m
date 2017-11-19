function [ ret ] = QualityControl( K_otw )
%QualityControl liczy wskazniki jakosci dla
%  Input args:
%    K_otw - transmitancja uk³adu otwartego
%  Returns:
%    ret - struktura z danymi



    %obliczenie transmitancji ukladu zamknietego
    K_zamk = K_otw/(1+K_otw);
    ret.K_zamk = K_zamk;

    
    %stan ustalony
    ret.st_ust = StanUst(K_zamk);
    
    %uchyb ust
    ret.e_ust = UchybUst(K_zamk, 1);
    
    %czas opoznienia 
    ret.t_opozn = CzasOpozn(K_zamk);
    
    
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
    [st_stab, st_osc] = WskPierwiastkowe(K_otw);
    ret.st_stab = st_stab;
    ret.st_osc = st_osc;
    
end

