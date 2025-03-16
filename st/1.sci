// Define parameters
N = 100; // Number of particles
L = 10;  // Box length
rho = N / L^2; // Density
dt = 0.01; // Time step
T = 1000; // Time steps
m = 1; // Particle mass
kB = 1.38e-23; // Boltzmann constant
T_temp = 300; // Temperature

dx = 1; // Grid size for density calculations
nbins = L / dx;
density = zeros(nbins, nbins);

// Generate random positions and velocities
x = L * rand(N, 1);
y = L * rand(N, 1);
vx = rand(N, 1) - 0.5;
vy = rand(N, 1) - 0.5;

// Compute local number density
for i = 1:N
    ix = int(x(i) / dx) + 1;
    iy = int(y(i) / dx) + 1;
    
    // Ensure indices are within valid bounds
    if (ix >= 1 & ix <= nbins & iy >= 1 & iy <= nbins) then
        density(ix, iy) = density(ix, iy) + 1;
    end
end

// Create subplots
clf;
subplot(2,2,1);
plot3d(1:nbins, 1:nbins, density);
title("Local Number Density Fluctuations");
xlabel("X Grid"); ylabel("Y Grid"); zlabel("Density");

// Simulate time evolution using velocity Verlet
for t = 1:T
    x = x + vx * dt;
    y = y + vy * dt;
end

// Plot example trajectory of a particle
subplot(2,2,2);
plot(1:N, x(1:N), "r");
title("Particle Position Evolution Over Time");
xlabel("Time"); ylabel("X Position");

// Compute velocity distribution
v = sqrt(vx.^2 + vy.^2);

// Use histplot instead of histc
subplot(2,2,3);
histplot(20, v);
title("Velocity Distribution");
xlabel("Velocity"); ylabel("Frequency");

// Maxwell-Boltzmann fit
v_theory = linspace(0, max(v), 100);
f_MB = (m / (2 * %pi * kB * T_temp))^(1.5) * 4 * %pi * v_theory.^2 .* exp(-m * v_theory.^2 / (2 * kB * T_temp));

// Overlay Maxwell-Boltzmann fit
plot(v_theory, f_MB, "r");
legend("Simulated", "Maxwell-Boltzmann");

// Molecular speed dependence on mass
m_values = [1, 2, 5, 10];
v_mean = zeros(size(m_values));

for i = 1:length(m_values)
    v_mean(i) = sqrt(8 * kB * T_temp / (m_values(i) * %pi));
end

subplot(2,2,4);
plot(m_values, v_mean, "bo-");
title("Mean Molecular Speed vs. Particle Mass");
xlabel("Particle Mass"); ylabel("Mean Speed");

// Fraction of molecules with most probable speed
v_mp = sqrt(2 * kB * T_temp / m);
fraction = exp(-m * v_mp^2 / (2 * kB * T_temp));

printf("Fraction of molecules with most probable speed: %f\n", fraction);
