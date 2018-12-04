function [ next_shluk, distance ] = find_next_shluk( distance_matrix, list_shluku )

iterations = 1:length(distance_matrix);

for i=length(list_shluku):-1:1
    iterations(list_shluku(i)) = [];
end

maxmin = -inf;
maxmin_index = -1;

for obraz=iterations
    
    min = inf;
    
    for shluk=list_shluku
        if obraz > shluk
            sloupec = obraz;
            radka = shluk;
        else
            sloupec = shluk;
            radka = obraz;
        end
        
        if distance_matrix(radka, sloupec) < min
            min = distance_matrix(radka, sloupec);
        end
    end
    
    if min > maxmin
        maxmin = min;
        maxmin_index = obraz;
    end
    
end

next_shluk = maxmin_index;
distance = maxmin;

end

