function ligne = trace_chemin(villes,chemin,mode,ax)

nb_ville = length(villes);
pos_chemin = villes([chemin,1],:);

if strcmp(mode,'iteratif')  
    
    for i=1:nb_ville
        ligne = line(ax,pos_chemin(i:i+1,1),pos_chemin(i:i+1,2));
        text(ax,pos_chemin(i,1)+0.01,pos_chemin(i,2)-0.01,num2str(i))
        pause(4/nb_ville)
    end
end
if strcmp(mode,'instantanee')
    ligne = line(ax,pos_chemin(:,1),pos_chemin(:,2));
%     text(pos_chemin(1:end,1)+0.01,pos_chemin(1:end,2)-0.01,num2str([1:nb_ville,1]'))
end

end