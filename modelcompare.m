clear all
data=csvread('lambdadata.csv',2);

extension=data(:,1)/max(data(:,1));
force=data(:,2)*10^-12*1.06*10^-7/(1.38064852*10^-23 * 298);

scatter(force,extension,10);
hold on
syms x

ezplot(coth(x)-1/x, [0, 60, 0, 1])

s=[0:0.001:0.98]
fjc=2/4*(1-s).^-2 - 2/4 + 2*s
plot(fjc,s)
ezplot(0.3*x, [0, 60, 0, 1])
legend('Lambda Phage Data (dimensionless)','Langevin function','Worm-Like Chain','Gaussian chain')
xlabel('Dimensionless pulling force')
ylabel('Dimensionless extension')
title('Comparisons of various models to the data')