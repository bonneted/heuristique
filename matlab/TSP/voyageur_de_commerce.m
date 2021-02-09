%% postitionnement des villes

rng 'default'

nb_ville = 100;
villes = rand(nb_ville,2);

dist_matrice =  dist(villes');

%% algo glouton
tic
scatter(villes(:,1),villes(:,2),'o')
title('Optimisation par algorithme glouton')

chemin_glouton = vdc_glouton(villes,dist_matrice);

trace_chemin(villes,chemin_glouton,'iteratif',gca);
toc
%%
taille_palier = nb_ville/4;
T=[];
Tc=0;

for i=1:3000
    T = [T,ones(1,taille_palier)*Tc];
    Tc = Tc*0.99;
end

%%
figure
chemin = vdc_recuit_simule(villes,T,1,gca);
