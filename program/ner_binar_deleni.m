%% --ROZTØÍDÌNÍ OBRAZÙ DO TØÍD METODOU NEROVNOMÌRNÉHO BINÁRNÍHO DÌLENÍ-- %%

shluky_cell = {};

shluk_to_split = data;

stredy_array = [];

chyby_array = [];



%% POSTUPNÉ DÌLENÍ SHLUKÙ
for loop_i=1:class_count-1
    
    pracovni_shluk_1 = [];
    pracovni_shluk_2 = [];
    
    distance_matrix = create_dist_mat(shluk_to_split);
    
    [ empty, obraz_1_i, obraz_2_i ] = triangular_mat_max(distance_matrix);
    
    dist_mat_bin = create_dist_mat_bin(distance_matrix, obraz_1_i, obraz_2_i);
    
    for i=1:length(dist_mat_bin)
        if dist_mat_bin(i, 1) < dist_mat_bin(i, 2)
            pracovni_shluk_1 = [pracovni_shluk_1; shluk_to_split(i, :)];
        else
            pracovni_shluk_2 = [pracovni_shluk_2; shluk_to_split(i, :)];
        end
    end
    
    stred_1 = sum(pracovni_shluk_1) / length(pracovni_shluk_1);
    
    stred_2 = sum(pracovni_shluk_2) / length(pracovni_shluk_2);

    J_pracovni_shluk_1 = J_shluku(pracovni_shluk_1, stred_1);
    J_pracovni_shluk_2 = J_shluku(pracovni_shluk_2, stred_2);
        
    if J_pracovni_shluk_1 > J_pracovni_shluk_2
        shluk_to_split = pracovni_shluk_1;
        shluky_cell{end+1} = pracovni_shluk_2;
    else
        shluk_to_split = pracovni_shluk_2;
        shluky_cell{end+1} = pracovni_shluk_1;
    end
end
shluky_cell{end+1} = shluk_to_split;

%% Pøeuspoøádání dat
data = zeros(length(data), data_dimension);
class_identity = zeros(length(data), 1);

loop_index = 1;
for shluk_i=1:length(shluky_cell)
    shluk = shluky_cell{shluk_i};
   for obraz_i=1:length(shluk)
       data(loop_index, :) = shluk(obraz_i, :);
       class_identity(loop_index) = shluk_i;
       loop_index = loop_index + 1;
   end
end

%% VYKRESLENÍ

plot_data







