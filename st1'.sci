clc;
clear;

// Parameters
N = 100; // Number of particles
L = 10;  // Box size
m = 1;   // Mass of particles
kB = 1;  // Boltzmann constant
T = 1;   // Temperature
sigma = 1; // LJ parameter
epsilon = 1; // LJ parameter
dt = 0.01; // Time step
steps = 1000; // Number of simulation steps

// Initialize positions and velocities
x = L * rand(1, N);
y = L * rand(1, N);
vx = sqrt(kB * T / m) * rand(1, N, "normal");
vy = sqrt(kB * T / m) * rand(1, N, "normal");

// Lennard-Jones Force Function
function [Fx, Fy] = LJ_force(x, y, L, N, sigma, epsilon)
    Fx = zeros(1, N);
    Fy = zeros(1, N);
    for i = 1:N
        for j = i+1:N
            dx = x(j) - x(i);
            dy = y(j) - y(i);
            r2 = dx^2 + dy^2;
            if r2 < (3 * sigma)^2 then
                r6 = (sigma^2 / r2)^3;
                F = 24 * epsilon * (2 * r6^2 - r6) / r2;
                Fx(i) = Fx(i) + F * dx;
                Fy(i) = Fy(i) + F * dy;
                Fx(j) = Fx(j) - F * dx;
                Fy(j) = Fy(j) - F * dy;
            end
        end
    end
endfunction

// Simulation loop
clf;
for t = 1:steps
    // Compute forces
    [Fx, Fy] = LJ_force(x, y, L, N, sigma, epsilon);
    
    // Update velocities and positions
    vx = vx + (Fx / m) * dt;
    vy = vy + (Fy / m) * dt;
    x = x + vx * dt;
    y = y + vy * dt;
    
    // Periodic boundary conditions
    x = modulo(x, L);
    y = modulo(y, L);
    
    // Plot particles
    clf;
    subplot(2,1,1)
    plot2d(x, y, -1);
    xgrid;
    title("Particle Simulation in a Box");
    xtitle("X Position", "Y Position");

    sleep(10);
end

// Velocity Distribution and Maxwell Comparison
vx_mag = sqrt(vx.^2 + vy.^2);
vbins = linspace(0, max(vx_mag), 20);
subplot(2,1,2)
histplot(vbins, histc(vx_mag, vbins));
title("Velocity Distribution vs Maxwell Distribution");
xlabel("Velocity");
ylabel("Frequency");

// Compute Mean Speed
mean_speed = mean(vx_mag);
printf("Mean Molecular Speed: %f\n", mean_speed);

// Compute Fraction of Molecules with Most Probable Speed
vmp = sqrt(2 * kB * T / m);
fraction = sum(abs(vx_mag - vmp) < 0.1) / N;
printf("Fraction of Molecules with Most Probable Speed: %f\n", fraction);
