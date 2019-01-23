%% --URÈENÍ POÈTU TØÍD POMOCÍ METODY SHLUKOVÉ HLADINY-- %%

%% INICIALIZACE

% Vzhledem ke zpùsobu generování trénovacích dat postaèí pro urèení tøíd
% použít výøez øeknìme první setina dat.
orizla_data = data(1:ceil(length(data)/100), :);
shluky = orizla_data;

prubeh_h = -1 * ones(length(shluky)-1, 1); % Prùbìh zmìny h

% Indexy bodù, které mají být spojeny
% - inicializováno na "nesmyslnou hodnotu"
shluk_to_merge_1 = -1;
shluk_to_merge_2 = -1;

%% VYTVOØENÍ DISTANÈNÍ MATICE
distance_matrix = create_dist_mat(orizla_data);

%% POSTUPNÉ SJEDNOCOVÁNÍ JEDNOTLIVÝCH SHLUKÙ

for i=1:length(orizla_data)-2
    
    [min_dist, shluk_to_merge_1, shluk_to_merge_2] = triangular_mat_min(distance_matrix);
    
    prubeh_h(i) = min_dist;
    
    new_shluk = (shluky(shluk_to_merge_1, :) + shluky(shluk_to_merge_2, :)) / 2;
    shluky(shluk_to_merge_1, :) = [];
    shluky(shluk_to_merge_2, :) = [];
    shluky = [shluky; new_shluk];
    
    % vyøíznutí odstranìných shlukù z matice
    distance_matrix(shluk_to_merge_1, :) = [];
    distance_matrix(shluk_to_merge_2, :) = [];
    distance_matrix(:, shluk_to_merge_1) = [];
    distance_matrix(:, shluk_to_merge_2) = [];
    
    % rozšíøení matice o novì vzniklý slouèený shluk
    distance_matrix = [distance_matrix zeros(length(distance_matrix), 1)];
    distance_matrix = [distance_matrix; zeros(1, length(distance_matrix))];
    % <-- TODO: OPTIMALIZOVAT
    
    for j=1:length(shluky)-1
        distance_matrix(j, end) = norm(shluky(end, :) - shluky(j, :));
    end
    
end

prubeh_h(end) = distance_matrix(1, 2); % Poslední slouèení

der_prubeh_h = my_derivative(prubeh_h); % Derivace prùbìhu zmìny h
[max_v, max_i] = max(der_prubeh_h);
inflex_point = prubeh_h(max_i);

% Poèet tøíd urèím podle indexu, u kterého dojde k nejvìtšímu skoku h.
[empty, pocet_trid_MSH] = max(der_prubeh_h);
pocet_trid_MSH = length(orizla_data) - pocet_trid_MSH;
pocet_trid = pocet_trid_MSH;

%% VYKRESLENÍ
figure
plot(prubeh_h)
hold on
plot(max_i, inflex_point, '*m')
hold off
title('Metoda shlukové hladiny - prùbìh h')
xlabel('Èíslo iterace slouèení')
ylabel('h')

figure
plot(der_prubeh_h)
hold on
plot(max_i, max_v, '*m')
hold off
title('Metoda shlukové hladiny - prùbìh zmìny h')
xlabel('Èíslo iterace slouèení')
ylabel('Zmìna h')

%% ZÁPIS DO SOUBORU
if exist('pocet_trid.txt', 'file') == 2
     delete pocet_trid.txt
end

% % V pøípadì verze R2017b a vyšší
% -->
% if isfile('cpocet_trid.txt')
%     delete pocet_trid.txt
% end
% <--

write_my_data(pocet_trid, 'pocet_trid');

%% PROÈIŠTÌNÍ WORKSPACE

vars = {'diff','empty', 'der_prubeh_h', 'min_dist', 'new_shluk', 'prubeh_h', 'shluk_to_merge_1', 'shluk_to_merge_2', 'shluky', 'i', 'j', 'distance_matrix', 'orizla_data'};
clear(vars{:})
clear vars



