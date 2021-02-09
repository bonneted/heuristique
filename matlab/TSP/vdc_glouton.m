function chemin = vdc_glouton(villes,dist_matrice)

nb_ville = length(villes);
chemin = ones(1,nb_ville);


villes_restantes = 2:nb_ville;
nouv_ville = 1;
% text(villes(1,1)+0.01,villes(1,2)-0.01,'1')

for i=2:nb_ville
    [~,ind_nouv_ville] = min(dist_matrice(nouv_ville,villes_restantes));
    nouv_ville = villes_restantes(ind_nouv_ville);
    chemin(i)=nouv_ville;
    villes_restantes(villes_restantes==nouv_ville)=[];
    
%     pos_chemin = villes(chemin(1:i),:);
%     line(pos_chemin(:,1),pos_chemin(:,2))
%     text(pos_chemin(i,1)+0.01,pos_chemin(i,2)-0.01,num2str(i))
%     pause(0.1)
end

% pos_chemin = villes([chemin,1],:);
% line(pos_chemin(:,1),pos_chemin(:,2))

end