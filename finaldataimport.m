subplot(2,2,1)
for i=1:4
    hold on
    scatter(extensiondata{1,i}(:,2),extensiondata{1,i}(:,1))
end
syms x
k501=ezplot(5*(coth(x)-1/x), [0, 20, 0, 30])
set(k501,'color','0, 0.4470, 0.7410')
k502=ezplot(10*(coth(x)-1/x), [0, 20, 0, 30])
set(k502,'color','0.8500, 0.3250, 0.0980')
k503=ezplot(15*(coth(x)-1/x), [0, 20, 0, 30])
set(k503,'color','0.9290, 0.6940, 0.1250')
k504=ezplot(20*(coth(x)-1/x), [0, 20, 0, 30])
set(k504,'color','0.4940, 0.1840, 0.5560')
xlabel('Dimensionless pulling force')
ylabel('Dimensionless length')
legend('Euler N=5','Euler N=10','Euler N=15','Euler N=20','Langevin*5','Langevin*10','Langevin*15','Langevin*20')
title('k=50')

subplot(2,2,2)
for i=1:4
    hold on
    scatter(extensiondata{2,i}(:,2),extensiondata{2,i}(:,1))
end
k501=ezplot(5*(coth(x)-1/x), [0, 20, 0, 30])
set(k501,'color','0, 0.4470, 0.7410')
k502=ezplot(10*(coth(x)-1/x), [0, 20, 0, 30])
set(k502,'color','0.8500, 0.3250, 0.0980')
k503=ezplot(15*(coth(x)-1/x), [0, 20, 0, 30])
set(k503,'color','0.9290, 0.6940, 0.1250')
k504=ezplot(20*(coth(x)-1/x), [0, 20, 0, 30])
set(k504,'color','0.4940, 0.1840, 0.5560')
xlabel('Dimensionless pulling force')
ylabel('Dimensionless length')
legend('Euler N=5','Euler N=10','Euler N=15','Euler N=20','Langevin*5','Langevin*10','Langevin*15','Langevin*20')
title('k=100')

subplot(2,2,3)
for i=1:4
    hold on
    scatter(extensiondata{4,i}(:,2),extensiondata{4,i}(:,1))
end
k501=ezplot(5*(coth(x)-1/x), [0, 20, 0, 30])
set(k501,'color','0, 0.4470, 0.7410')
k502=ezplot(10*(coth(x)-1/x), [0, 20, 0, 30])
set(k502,'color','0.8500, 0.3250, 0.0980')
k503=ezplot(15*(coth(x)-1/x), [0, 20, 0, 30])
set(k503,'color','0.9290, 0.6940, 0.1250')
k504=ezplot(20*(coth(x)-1/x), [0, 20, 0, 30])
set(k504,'color','0.4940, 0.1840, 0.5560')
xlabel('Dimensionless pulling force')
ylabel('Dimensionless length')
legend('Euler N=5','Euler N=10','Euler N=15','Euler N=20','Langevin*5','Langevin*10','Langevin*15','Langevin*20')
title('k=500')

subplot(2,2,4)
for i=1:4
    hold on
    scatter(extensiondata{3,i}(:,2),extensiondata{3,i}(:,1))
end
k501=ezplot(5*(coth(x)-1/x), [0, 20, 0, 30])
set(k501,'color','0, 0.4470, 0.7410')
k502=ezplot(10*(coth(x)-1/x), [0, 20, 0, 30])
set(k502,'color','0.8500, 0.3250, 0.0980')
k503=ezplot(15*(coth(x)-1/x), [0, 20, 0, 30])
set(k503,'color','0.9290, 0.6940, 0.1250')
k504=ezplot(20*(coth(x)-1/x), [0, 20, 0, 30])
set(k504,'color','0.4940, 0.1840, 0.5560')
xlabel('Dimensionless pulling force')
ylabel('Dimensionless length')
legend('Euler N=5','Euler N=10','Euler N=15','Euler N=20','Langevin*5','Langevin*10','Langevin*15','Langevin*20')
title('k=1000')