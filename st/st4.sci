R=8.314;
h=6.625*10.^-34;
k=1.38*10.^-23;
v=15*10^12;
for T=10:10:1000;
    DP=3*R; //Dulong petit law
    a=(h*v)/(k*T);
    E=(((3*R)*(a^2)*(exp(a)))/((exp(a)-1)^2)); // Einstein distribution law
    funcprot(0)
    function c=f(x)
        c=(x^4)*exp(x)/((exp(x)-1)^2);
    endfunction
    D=(9*R*((1/a)^3)*intg(0,a,f)); //Debye Distribution law 
    plot(T,DP,'r*');
    plot(T,E,'b+');
    plot(T,D,'g*');
end
xlabel('Temperature (T)')
ylabel('Specific heat (Cv)')
title('Specific heat Vs. Temperature Plot')
legend('Dulong-petit','Einstein Distribution','Debye model',4)

/*
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
*/
