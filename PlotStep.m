function [ ] = PlotStep( figure_nr, K, title, Tmax )

    figure(figure_nr);
    hold on
    
    st_ust = StanUst( K );
    
    if (~exist('Tmax', 'var'))
        step(K);
    else
        step(K, Tmax);
    end
    
    plot(get(gca,'xlim'), [st_ust st_ust], 'k--');
    AddLegend( strcat('Odp skok', title) )
    AddLegend( strcat('Stan ust', title) )

end

