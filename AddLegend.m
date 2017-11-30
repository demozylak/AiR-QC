function [  ] = AddLegend( text )

    L = legend;
    L = get(L);
    if isstruct(L)
        L = L.String;
    else
        L = '';
    end
    
    L{end+1} = [text]; 
    
    legend(L);

end

