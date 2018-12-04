%% --UR�EN� PO�TU T��D POMOC� METODY �ET�ZOV� MAPY-- %%

prubeh_skok = -1 * ones(length(data)-2, 1); % Pr�b�h velikosti skoku k dal��mu obrazu

%% VYTVO�EN� DISTAN�N� MATICE
distance_matrix = zeros(data_length, data_length);
for i=1:data_length
    for j=(i+1):data_length
        diff = norm(data(i, :) - data(j, :));
        distance_matrix(i, j) = diff;
    end
end

%% V�B�R PRVN�HO OBRAZU

x = x_0; % index obrazu x v datech

[skok, x_next] = closest_image(x, distance_matrix);

prubeh_skok(1) = skok;

% vy��znut� p�edchoz�ho obrazu z matice
distance_matrix(x, :) = [];
distance_matrix(:, x) = [];

%% POSTUPN� SKOKY NA DAL�� NEJBLI��� OBRAZ

for i=2:data_length-1
    
    x = x_next;
    [skok, x_next] = closest_image(x, distance_matrix);
    
    prubeh_skok(i) = skok;
    
    % TODO: OPTIMALIZOVAT -->
    % vy��znut� p�edchoz�ho obrazu z matice
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















