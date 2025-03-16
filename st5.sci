//Maxwell-Boltzwell statistics
x=linspace(0,50,100)
m1=1./exp(x/1)
m2=1./exp(x/5)
m3=1./exp(x/10)
m4=1./exp(x/20)
//subplot(2,1,1)
figure(0)
plot(x,m1,x,m2,x,m3,x,m4) 
xlabel('Energy')
ylabel('Occupation number')
title('Occupation number vs Energy for M-B Distribution');
legend('T=100K','T=200K','T=500K','T=1000K')

//Fermi-Dirac stastics
y=linspace(-50,50,100);
f1=1./(exp(y/1)+1);
f2=1./(exp(y/5)+1);
f3=1./(exp(y/10)+1);
f4=1./(exp(y/20)+1);
//subplot(2,1,2)
figure(1)
plot(y,f1,y,f2,y,f3,y,f4)
xlabel('Energy')
ylabel('Occupation number')
title('Occupation number vs Energy for F-D Distribution');
legend('T=100K','T=200K','T=500K','T=1000K')
