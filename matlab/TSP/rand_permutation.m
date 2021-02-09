function chemin_voisin = rand_permutation(chemin)

nb_villes = length(chemin);

indexes = randsample(2:nb_villes,2);
ind1=min(indexes);
ind2=max(indexes);

chemin_voisin = chemin;
chemin_voisin(ind1:ind2) = fliplr(chemin_voisin(ind1:ind2)) ;
end