bound = pi;
n_part = 20;
x_min = -bound;x_max = bound;y_min = -bound;y_max = bound;
pas = (x_max-x_min)/1000;

cost_function= @(x,y) ackley({x,y});

x_grid = x_min:pas:x_max;
y_grid = y_min:pas:y_max;


[X,Y] = meshgrid(x_grid,y_grid);
G = cost_function(X,Y);
map_fig = nexttile;
hold on;
imagesc(x_grid,y_grid,G)
hold on;
contour(X,Y,G,20)
colorbar

g_fig = nexttile;

% part = cell(6,1); 

particules.pos=zeros(n_part,2);
particules.v=zeros(n_part,2);

particules.pos_opt=zeros(n_part,2);
particules.g_opt=zeros(n_part,1);

particules.omega = 1; %inertie
particules.alpha = 2; %propre min
particules.beta = 2.1; %min global
particules.v_max = 2*pas;

particules.pos_opt_global = [x_min+rand*(x_max-x_min),y_min+rand*(y_max-y_min)];
particules.g_opt_global = cost_function(particules.pos_opt_global(1),particules.pos_opt_global(2));


for i=1:n_part
    particules.pos(i,:) = [x_min+rand*(x_max-x_min),y_min+rand*(y_max-y_min)];
    particules.pos_opt(i,:) = particules.pos(i,:);
    
    particules.g_opt(i) = cost_function(particules.pos(i,1),particules.pos(i,2));
    particules.v(i,:) =  [pas*rand,pas*rand]; 
    if particules.g_opt(i) < particules.g_opt_global
        particules.g_opt_global = particules.g_opt(i);
        particules.pos_opt_global = particules.pos(i,:);
    end

end


g_plot =[];
temps_min_global=0;

for iter=1:500 
    
    for i = 1:n_part
        r = rand(1,2);
        particules.v(i,:) = omega*particules.v(i,:) + r(1)*alpha*(particules.pos_opt(i,:)-particules.pos(i,:)) + r(2)*beta*(particules.pos_opt_global-particules.pos(i,:));  
        
        if v_max<norm(particules.v(i,:))
            particules.v(i,:) = particules.v(i,:)*v_max/norm(particules.v(i,:));
        end

        particules.pos(i,:) = particules.pos(i,:) + particules.v(i,:);
   
        g = cost_function(particules.pos(i,1),particules.pos(i,2));
        
        if g<particules.g_opt(i)
            particules.g_opt(i) = g;
            particules.pos_opt(i,:) = particules.pos(i,:);
            if g<particules.g_opt_global
                particules.g_opt_global = g;
                particules.pos_opt_global = particules.pos(i,:);
                temps_min_global = iter;
                
            end
        end
        
    end
    delete(line);

    line = plot(map_fig,particules.pos(:,1),particules.pos(:,2),'k.');
    xlim([x_min x_max])
    ylim([y_min y_max])
    
    g_plot = [g_plot, particules.g_opt_global];
    plot(g_fig,g_plot)
    text(g_fig,0.7,0.8,sprintf('min_{global} = %.3f \n atteint en %.1f',[particules.g_opt_global,temps_min_global]),'units','normalized')
    drawnow;
    if iter > 100 && abs((g_plot(end) - mean(g_plot(iter-100:end))))< 1e-10
        break
    end
end