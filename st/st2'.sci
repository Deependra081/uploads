// Constants and parameters
beta_values = linspace(0.1, 5, 100);
energy_levels = [1, 2, 3, 4];
// Partition function for a finite system
function Z = partition_function(beta, energies)
 Z = sum(exp(-beta * energies));
endfunction
// Compute average energy and specific heat
avg_energy = zeros(1, length(beta_values));
specific_heat = zeros(1, length(beta_values));
for i = 1:length(beta_values)
 beta = beta_values(i);
 Z = partition_function(beta, energy_levels);
 avg_energy(i) = sum(energy_levels .* exp(-beta * energy_levels)) / Z;
end
specific_heat = diff(avg_energy) ./ diff(beta_values);
// Plot results
subplot(2,1,1)
plot(beta_values, avg_energy, 'b-');
xlabel('Beta (1/kT)');
ylabel('Average Energy');
title('Average Energy vs Beta');
subplot(2,1,2)
plot(beta_values(1:$-1), specific_heat, 'r-');
xlabel('Beta (1/kT)');
ylabel('Specific Heat');
title('Specific Heat vs Beta');
