clc
clear all

N_steps=10000
N_beads=30
k=1
dim=3

r = rand(3,N_steps,N_beads); % Initial array of non dimensional positions 9

delta_t = 0.001; %Non dimensional Time step
Std_BF_nonDim=sqrt(2*delta_t);

f = inline('a*(1-norm(a)^-1)','a');

% Brownian Dynamics
for K=1:10
    k=K
    for N_beads=3:13
        for e=1:10
            p=e*[1;0;0];
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
    extension_curve(e,2)=e;
    end
    extensiondata{K,N_beads-2}=extension_curve
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

extension=((r(1,:,N_beads)-r(1,:,1)));

plot(extension)

for m=1:4
    for h=1:5
    gradient(m,h)=(extensiondata{m,h}(5,2)-extensiondata{m,h}(1,2))/(extensiondata{m,h}(5,1)-extensiondata{m,h}(1,1))
    end
end


plot(gradient)
%legend('1','2','3','4','5','6','7','8','9','10','11','12','13')
xlabel('k')
ylabel('force/extension')