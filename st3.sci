h=6.626e-34;//Planck's constant
k=1.38e-23;//Boltzmann constant
c=3e8;//Speed of light
t=[1000,1200,1400];//Temperature(Kelvin)
n=1400;
r=linspace(0.1e-6,15e-6,n);
r0=linspace(5e-6,15e-6,n);
for i=1:n
    for j=1:3
        u(j,i)=(8*%pi*h*c)/((r(i))^5*(exp(h*c/(r(i)*k*t(j)))-1));
        m(j,i)=(8*%pi*k*t(j))/(r0(i))^4;
    end
end 
plot(r,u(1,:),'r',r,u(2,:),'g',r,u(3,:),'b',r0,m(1,:),'c',r0,m(2,:),'m',r0,m(3,:),'y')
xlabel('Wavelength(m)');
ylabel('Energy');
title('ComparisonofPlancksandRayleigh-JeansLaw');
legend('PlanckT=1000K','PlanckT=1200K','PlanckT=1400K','Rayleigh-JeansT=1000K','Rayleigh-JeansT=1200K','Rayleigh-JeansT=1400K');
