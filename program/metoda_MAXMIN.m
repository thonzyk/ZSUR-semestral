%% --URÈENÍ POÈTU TØÍD POMOCÍ METODY MAXMIN-- %%

%% VYTVOØENÍ DISTANÈNÍ MATICE
distance_matrix = zeros(data_length, data_length);
for i=1:data_length
    for j=(i+1):data_length
        diff = norm(data(i, :) - data(j, :));
        distance_matrix(i, j) = diff;
    end
end

%% INICIALIZACE

q = 0.6;

[ max, max_i, max_j ] = triangular_mat_max(distance_matrix);

list_shluku = [max_i max_j];
list_shluku = sort(list_shluku);

prumer_vzdalenosti_shluku = max;

[next_shluk, next_shluk_vzdalenost] = find_next_shluk(distance_matrix, list_shluku);

while next_shluk_vzdalenost > q*prumer_vzdalenosti_shluku
    list_shluku = [list_shluku next_shluk];
    list_shluku = sort(list_shluku);
    prumer_vzdalenosti_shluku = ( ( (length(list_shluku)-1) * prumer_vzdalenosti_shluku ) + next_shluk_vzdalenost ) / length(list_shluku);
    
    [next_shluk, next_shluk_vzdalenost] = find_next_shluk(distance_matrix, list_shluku);
end












