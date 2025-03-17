E = [0, 1, 2]; N = 3; beta = linspace(0.1, 10, 100);  T = 1 ./ beta; z = zeros(beta);
sum_Eexp = zeros(beta);sum_E2exp = zeros(beta);
for i = 1:length(beta)
    b = beta(i);
    exp_term = exp(-b * E);
    z(i) = sum(exp_term);
    sum_Eexp(i) = sum(E .* exp_term);
    sum_E2exp(i) = sum(E.^2 .* exp_term);
end
Z = z .^ N;
U = N * (sum_Eexp ./ z);
var = N * (sum_E2exp ./ z - (sum_Eexp ./ z).^2);
fluctuations = sqrt(var);
C = var .* beta.^2;
figure(0);
subplot(2,2,1);
plot(T, Z, 'r');xlabel("Temperature (T)");ylabel("Z");title("Partition Function vs T");
subplot(2,2,2);
plot(T, U, 'b');xlabel("Temperature (T)");ylabel("U");title("Average Energy vs T");
subplot(2,2,3);
plot(T, fluctuations, 'g');xlabel("Temperature (T)");ylabel("σ");title("Energy Fluctuations vs T");
subplot(2,2,4);
plot(T, C, 'm');xlabel("Temperature (T)");ylabel("C");title("Specific Heat vs T");
E1 = 0; E2 = 1;  mu = -0.5;beta = linspace(0.1, 10, 100);
MB_ratio = exp(beta * (E2 - E1));
FD_ratio = (exp(beta * (E2 - mu)) + 1) ./ (exp(beta * (E1 - mu)) + 1);
BE_ratio = (exp(beta * (E2 - mu)) - 1) ./ (exp(beta * (E1 - mu)) - 1);
figure(1);
subplot(2,2,1)
plot(beta, MB_ratio, 'r', beta, FD_ratio, 'g', beta, BE_ratio, 'b');xlabel("β");ylabel("n1/n2");title("Occupation Number Ratios");
legend("MB", "FD", "BE");
subplot(2,2,2)
plot(log(beta), log(C), 'k');xlabel("log(β)");ylabel("log(C)");title("Specific Heat (Log-Log)");
subplot(2,2,3)
plot(log(beta), log(MB_ratio), 'r', log(beta), log(FD_ratio), 'g', log(beta), log(BE_ratio), 'b');xlabel("log(β)");ylabel("log(n1/n2)");title("Occupation Ratios (Log-Log)");legend("MB", "FD", "BE");
