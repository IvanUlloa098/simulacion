C = readtable('por-canton.csv');

cantones = C.Var1(2:height(C), :);
op = linspace(2,height(C),height(C)-1);

fig = uifigure();
axes('Parent',fig);

dd = uidropdown(fig, 'Items',cantones,...
                    'ItemsData', op, ...
                    'Position', [20 2 300 20],...
                    'ValueChangedFcn', @(dd,event) optionSelected(dd, fig));

function optionSelected(dd, fig)
    axes('Parent',fig);
    
    val = dd.Value;
    display(val);
    C = readtable('por-canton.csv');

    a = table2array(C([1], 2:width(C)));
    c = table2array(C([val], 2:width(C)));
    
    b  = polyfit(a', c', 1);
    yf = polyval(b, a');
    
    xlabel('Año');
    ylabel('Cantidad (USD)');
    title('Remesas a lo largo del tiempo');
    
    hold(gca, 'on');
    scatter(gca, a', c');
    hold(gca, 'off');
    hold(gca, 'on');
    plot(gca, a', yf);
    hold(gca, 'off');
    legend(gca,'Datos', 'Linea de regresion');
    
    grid(gca, 'on')
    end