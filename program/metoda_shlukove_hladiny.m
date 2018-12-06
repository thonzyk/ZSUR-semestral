%% --URÈENÍ POÈTU TØÍD POMOCÍ METODY SHLUKOVÉ HLADINY-- %%

%% INICIALIZACE

shluky = data; % Na zaèátku se støedy shlukù shodují se všemi jednotlivými daty

prubeh_h = -1 * ones(length(data)-1, 1); % Prùbìh zmìny h

%min_distance = 0;
shluk_to_merge_1 = inf;
shluk_to_merge_2 = inf;

dead_shluky = 0; % seznam slouèených shlukù

%% VYTVOØENÍ DISTANÈNÍ MATICE
distance_matrix = zeros(length(data), length(data));
for i=1:length(shluky)
    for j=(i+1):length(shluky)
        diff = norm(shluky(i, :) - shluky(j, :));
        distance_matrix(i, j) = diff;
        %         if diff < min_distance
        %             min_distance = diff;
        %             shluk_to_merge_1 = i;
        %             shluk_to_merge_2 = j;
        %         end
    end
end

%% POSTUPNÉ SJEDNOCOVÁNÍ JEDNOTLIVÝCH SHLUKÙ

for i=1:length(data)-2
    
    [min_dist, shluk_to_merge_1, shluk_to_merge_2] = triangular_mat_min(distance_matrix);
    
    prubeh_h(i) = min_dist;
    
    new_shluk = (shluky(shluk_to_merge_1, :) + shluky(shluk_to_merge_2, :)) / 2;
    shluky(shluk_to_merge_1, :) = [];
    shluky(shluk_to_merge_2, :) = [];
    shluky = [shluky; new_shluk];
    
    
    % TODO: OPTIMALIZOVAT -->
    % vyøíznutí odstranìných shlukù z matice
    distance_matrix(shluk_to_merge_1, :) = [];
    distance_matrix(shluk_to_merge_2, :) = [];
    distance_matrix(:, shluk_to_merge_1) = [];
    distance_matrix(:, shluk_to_merge_2) = [];
    % <-- TODO: OPTIMALIZOVAT
    
    
    % rozšíøení matice o novì vzniklý slouèený shluk
    distance_matrix = [distance_matrix zeros(length(distance_matrix), 1)];
    distance_matrix = [distance_matrix; zeros(1, length(distance_matrix))];
    
    for j=1:length(shluky)-1
        distance_matrix(j, end) = norm(shluky(end, :) - shluky(j, :));
    end
    
end

prubeh_h(end) = distance_matrix(1, 2); % Poslední slouèení

der_prubeh_h = my_derivative(prubeh_h); % Derivace prùbìhu zmìny h

[empty, pocet_trid_MSH] = max(der_prubeh_h);

pocet_trid_MSH = length(data) - pocet_trid_MSH; % Výsledné urèení poètu tøíd


%% VYKRESLENÍ
% figure
% plot(prubeh_h)
% 
% figure
% plot(der_prubeh_h)



