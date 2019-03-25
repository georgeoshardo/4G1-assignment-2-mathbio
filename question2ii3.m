clc
clear all

N_steps=10000;
N_beads=20;
k=10;
dim=3;

 % Initial array of non dimensional positions 9

delta_t = 0.001; %Non dimensional Time step
Std_BF_nonDim=sqrt(2*delta_t);

f = inline('a*(1-norm(a)^-1)','a');


for K=1:4
    Ki=[50 100 500 100];
    k=Ki(K);
    for Nb=1:4
        Nb
        Ni=[5 10 15 20];
        N_beads=Ni(Nb);
        r = rand(3,N_steps,N_beads);
        for e=1:11
            ei=[1 2 4 6 8 10 12 14 16 18 20];
            p=ei(e)*[1;0;0];
            p
            for i=1:N_steps
                for b=2:N_beads-1
                r(:,i+1,b) = (...
                    r(:,i,b)-...
                    delta_t*k*(...
                    (f(r(:,i,b)-r(:,i,b-1))) +...
                    (f(r(:,i,b)-r(:,i,b+1)))...
                    )...
                    )+...
                    Std_BF_nonDim * normrnd(0,1,[dim,1]);
            end  
            r(:,i+1,1) = (...
                r(:,i,1)-...
                delta_t*( k*f(r(:,i,1)-r(:,i,2)) +...
                p)...
                )+...
                Std_BF_nonDim * normrnd(0,1,[dim,1]);
            r(:,i+1,N_beads) = (...
            r(:,i,N_beads)-...
            delta_t*( k*f(r(:,i,N_beads)-r(:,i,N_beads-1)) -...
            p))...
            +...
            Std_BF_nonDim * normrnd(0,1,[dim,1]);
            end
            extension=((r(1,:,N_beads)-r(1,:,1)));
            extension_curve(e,1)=extension(end);
            extension_curve(e,2)=ei(e);
        end
    extensiondata{K,Nb}=extension_curve
    K
    end
end



result = r; % the result




plot(extension)

for m=1:4
    for h=1:4
    gradient(m,h)=(extensiondata{m,h}(5,2)-extensiondata{m,h}(1,2))/(extensiondata{m,h}(5,1)-extensiondata{m,h}(1,1))
    end
end
for i=1:4
    hold on
    scatter(extensiondata{i,1}(:,2),extensiondata{i,1}(:,1))
end
xlim([0 1000])
ylim([0 1])

for i=1:4
    hold on
    scatter(extensiondata{3,i}(:,2),extensiondata{3,i}(:,1))
end