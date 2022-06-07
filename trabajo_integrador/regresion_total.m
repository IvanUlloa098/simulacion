T = readtable('pais-origen.csv');
T.Variance(isnan(T.Variance)) = 0;

x = T.Year; 
y = T.Amount;

b  = polyfit(x, y, 1);
yf = polyval(b, x);

figure(1)
xlabel('Año');
ylabel('Cantidad (USD)');
title('GUAYAS - Remesas a lo largo del tiempo');

hold on
scatter(x, y)
hold off
hold on
plot(x, yf)
hold off
legend('Estimacion', 'Datos')

grid on