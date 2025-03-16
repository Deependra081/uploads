x = linspace(1, 1000, 100); 
y1 = 25 * ones(x);
y2 = 25 * (1 - exp(-x / 150));
y3 = 25 * (1 - exp(-x / 200));
plot(x, y1, "r");
plot(x, y2, "g");
plot(x, y3, "b");
xlabel('Temperature (T)')
ylabel('Specific heat (Cv)')
title('Specific heat Vs. Temperature Plot')
legend('Dulong-petit','Einstein Distribution','Debye model',4)
