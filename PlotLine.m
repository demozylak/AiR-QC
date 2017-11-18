function [ ] = PlotLine( yPos, lineSpec)
    if (~exist('lineSpec', 'var'))
        plot(get(gca,'xlim'), [yPos yPos]);
    else
        plot(get(gca,'xlim'), [yPos yPos],lineSpec);
    end
end

