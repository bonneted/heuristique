function chemin = vdc_recuit_simule(villes,T,showplot,ax)

t_fin = length(T);

nb_villes = length(villes);
dist_matrice = dist(villes');

chemin = [1,randperm(nb_villes-1)+1];

if showplot   
    scatter(ax,villes(:,1),villes(:,2),'ro')
    l1 = trace_chemin(villes,chemin,'instantanee',ax);
end

list_dist =zeros(1,t_fin); 

for i=1:t_fin
    list_dist(i)=calc_dist(chemin,dist_matrice);
    nouv_chemin = rand_permutation(chemin);
    
    delta_F = calc_dist(nouv_chemin,dist_matrice)-calc_dist(chemin,dist_matrice);
    if delta_F<0

        chemin = nouv_chemin;
        if showplot
            delete(l1)
            l1 = trace_chemin(villes,chemin,'instantanee',ax);
            drawnow;    
        end
    
    elseif rand<exp(-delta_F/T(i))
        chemin = nouv_chemin;
        if showplot
            delete(l1)
            l1 = trace_chemin(villes,chemin,'instantanee',ax);
            drawnow;    
        end
    end
end

nexttile

yyaxis right
plot(T)
hold on;
yyaxis left
plot(list_dist)

text(0.7,0.8,sprintf('d_{final} = %.3f',list_dist(end)),'units','normalized')
legend('Distance du chemin','Température')
nexttile
scatter(villes(:,1),villes(:,2),'ro')
trace_chemin(villes,chemin,'instantanee',gca);

end

