function dist_chemin = calc_dist(chemin,dist_matrice)

liste_dist = zeros(size(chemin));
for ind=1:length(chemin)-1
    liste_dist(ind)= dist_matrice(chemin(ind),chemin(ind+1));
end
liste_dist(end) = dist_matrice(chemin(end),1);
dist_chemin = sum(liste_dist);
end