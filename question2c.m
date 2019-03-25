clc
clear all

N_steps=20000
N_beads=20
k=10
dim=3

 % Initial array of non dimensional positions 9

delta_t = 0.001; %Non dimensional Time step
Std_BF_nonDim=sqrt(2*delta_t);

f = inline('a*(1-norm(a)^-1)','a');

% Brownian Dynamics
% for K=[30 50 100 500 1000]
%     k=K
%     Ki=1;
%     for N_beads=[5 7 9 10 20]
%         Ni=1;        
%         for e=[100 500 1000 3000 6000]
%             p=e*[1;0;0];
%             ei=1
%             for i=1:N_steps
%                 for b=2:N_beads-1
%                     r(:,i+1,b) = (...
%                     r(:,i,b)-...
%                     delta_t*k*(...
%                     (f(r(:,i,b)-r(:,i,b-1))) +...
%                     (f(r(:,i,b)-r(:,i,b+1)))...
%                     )...
%                     )+...
%                     Std_BF_nonDim * normrnd(0,1,[dim,1]);
%                 end  
%                 r(:,i+1,1) = (...
%                 r(:,i,1)-...
%                 delta_t*( k*f(r(:,i,1)-r(:,i,2)) +...
%                 p)...
%                 )+...
%                 Std_BF_nonDim * normrnd(0,1,[dim,1]);
%                 r(:,i+1,N_beads) = (...
%                 r(:,i,N_beads)-...
%                 delta_t*(k*f(r(:,i,N_beads)-r(:,i,N_beads-1)) -...
%                 p))...
%                 +...
%                 Std_BF_nonDim * normrnd(0,1,[dim,1]);
%             end
%             
%             extension=((r(1,:,Ni)-r(1,:,1)));
% 
%             extension_curve(ei,1)=extension(end);
%             extension_curve(ei,2)=e;
%             extensiondata{Ki,Ni}=extension_curve
%             ei=ei+1
%         end
%     Ni=Ni+1;
%     K
%     Ki=Ki+1;
%     end
% end


for K=1:4
    Ki=[30 50 100 500];
    k=Ki(K);
    for Nb=1:4
        Ni=[5 7 10 15];
        N_beads=Ni(Nb);
        r = rand(3,N_steps,N_beads);
        for e=1:5
            ei=[1 5 10 15 20];
            p=ei(e)*[1;0;0];
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


% for i=1:N_steps
%         plot3(r(1,[1:i]),r(2,[1:i]),r(3,[1:i]))
%         pause(0.00001)
% end

%plot3(result(1,:,1),result(2,:,1),result(3,:,1))

% mean_square_disp_0=sqrt(result(1,:,1).^2+result(2,:,1).^2+result(3,:,1).^2);
% mean_square_disp_N=sqrt(result(1,:,N_beads).^2+result(2,:,N_beads).^2+result(3,:,N_beads).^2);
% chain_extension=sqrt((result(1,:,N_beads)-result(1,:,1)).^2+...
%     (result(2,:,N_beads)-result(2,:,1)).^2+...
%     (result(3,:,N_beads)-result(3,:,1)).^2);

%plot(chain_extension)
%plot([delta_t:delta_t:delta_t*N_steps],mean(squaredispl))

% for o=1:N_beads
%     plot3(result(1,:,o),result(2,:,o),result(3,:,o))
%     hold on
% end
% 
% for o=1:N_beads
%     scatter3(result(1,N_steps,o),result(2,N_steps,o),result(3,N_steps,o))
%     hold on
% end


plot(extension)

for m=1:4
    for h=1:5
    gradient(m,h)=(extensiondata{m,h}(5,2)-extensiondata{m,h}(1,2))/(extensiondata{m,h}(5,1)-extensiondata{m,h}(1,1))
    end
end
for i=1:4
    hold on
    plot(extensiondata{i,1}(:,2),extensiondata{i,1}(:,1)/Ni(4))
end
xlim([0 1000])
ylim([0 1])

for i=1:4
    hold on
    plot(extensiondata{3,i}(:,2),extensiondata{3,i}(:,1))
end