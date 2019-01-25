%% --ROZTØÍDÌNÍ OBRAZÙ DO TØÍD METODOU K-MEANS-- %%
load_data

%% INICIALIZACE
shluky_cell = cell(1, pocet_trid); % Seznamy indexù bodù ve shlucích

stredy_matrix = zeros(pocet_trid, data_dimension);

% Na zaèátku zvolím relativnì vzdálené støedy
orizla_data = data(1:10*pocet_trid, :);
oriz_distance_matrix = create_dist_mat(orizla_data);
[empty, stred_1_i, stred_2_i] = triangular_mat_max(oriz_distance_matrix);
stredy_array = [stred_1_i, stred_2_i];
for i=3:pocet_trid
    dist_vect = sum_dists(oriz_distance_matrix, stredy_array);
    [empty, next_stred] = max(dist_vect);
    stredy_array = [stredy_array next_stred];
end
for i=1:pocet_trid
    stredy_matrix(i, :) = data(stredy_array(i), :);
end

previous_stredy_matrix = zeros(pocet_trid, data_dimension);

% Pøedchozí støedy jsou inicializovány na "nesmyslnou hodnotu"
for i=1:pocet_trid
    previous_stredy_matrix(i, :) = -inf * ones(1, data_dimension);
end

%% ALGORITMUS
while stredy_matrix ~= previous_stredy_matrix
    
    for i=1:length(shluky_cell)
        shluky_cell{i} = [];
    end
    
    for i=1:length(data)
        [stred_index, distance2] = closest_stred(data(i, :), stredy_matrix);
        
        shluky_cell{stred_index} = [shluky_cell{stred_index} i];
    end
   
    previous_stredy_matrix = stredy_matrix;

    for i=1:pocet_trid
        stredy_matrix(i, :) = avg_vector(shluky_cell{i}, data);
    end
end

%% PØEDÁNÍ VÝSLEDKU DO CLASS_IDENTITY
for i=1:length(shluky_cell)
    T = shluky_cell{i};
    for j=T
        class_identity(j) = i;
    end
end

class_identity_keras = zeros(length(class_identity), 3);

for i=1:length(class_identity)
    class_identity_keras(i, class_identity(i)) = 1;
end


%% VYKRESLENÍ
figure
plot_data
title('Metoda k-means')
xlabel('x_1')
ylabel('x_2')

%% ZÁPIS DO SOUBORU
if exist('class_identity.txt', 'file') == 2
     delete class_identity.txt
end

% % V pøípadì verze R2017b a vyšší
% -->
% if isfile('class_identity.txt')
%     delete class_identity.txt
% end
% <--
% 
write_my_data(class_identity, 'class_identity');

%% PROÈIŠTÌNÍ WORKSPACE
vars = {'distance2','i','j', 'patterns_in_class', 'previous_stredy_matrix', 'stred_index', 'T', 'T_cell', 'css_identity', 'dist_vect', 'empty', 'i', 'next_stred', 'oriz_distance_matrix', 'orizla_data', 'stred_1_i', 'stred_2_i', 'stredy_array'};
clear(vars{:})
clear vars
