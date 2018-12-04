%% --URÈENÍ POÈTU TØÍD POMOCÍ METODY ØETÌZOVÉ MAPY-- %%

prubeh_skok = -1 * ones(length(data)-2, 1); % Prùbìh velikosti skoku k dalšímu obrazu

%% VYTVOØENÍ DISTANÈNÍ MATICE
distance_matrix = zeros(data_length, data_length);
for i=1:data_length
    for j=(i+1):data_length
        diff = norm(data(i, :) - data(j, :));
        distance_matrix(i, j) = diff;
    end
end

%% VÝBÌR PRVNÍHO OBRAZU

x = x_0; % index obrazu x v datech

[skok, x_next] = closest_image(x, distance_matrix);

prubeh_skok(1) = skok;

% vyøíznutí pøedchozího obrazu z matice
distance_matrix(x, :) = [];
distance_matrix(:, x) = [];

%% POSTUPNÉ SKOKY NA DALŠÍ NEJBLIŽŠÍ OBRAZ

for i=2:data_length-1
    
    x = x_next;
    [skok, x_next] = closest_image(x, distance_matrix);
    
    prubeh_skok(i) = skok;
    
    % TODO: OPTIMALIZOVAT -->
    % vyøíznutí pøedchozího obrazu z matice
    distance_matrix(x, :) = [];
    distance_matrix(:, x) = [];
    % <-- TODO: OPTIMALIZOVAT
end

figure
plot(prubeh_skok)

%sorted_prubeh_skok = sort(prubeh_skok);
%der_sorted_prubeh_skok = my_derivative(sorted_prubeh_skok);

%[max_sko, max_skok_index] = max(der_sorted_prubeh_skok);

%pocet_trid_MRM = length(prubeh_skok) - max_skok_index + 1















