%% --URÈENÍ POÈTU TØÍD POMOCÍ METODY ØETÌZOVÉ MAPY-- %%

% Vzhledem ke zpùsobu generování trénovacích dat postaèí pro urèení tøíd
% použít výøez øeknìme první setina dat.
orizla_data = data(1:ceil(length(data)/100), :);

prubeh_skok = -1 * ones(length(orizla_data)-2, 1); % Prùbìh velikosti skoku k dalšímu obrazu

%% VYTVOØENÍ DISTANÈNÍ MATICE
distance_matrix = create_dist_mat(orizla_data);

%% INICIALIZACE

x = ceil(rand*length(orizla_data)); % index obrazu x v datech (inicializace náhodným výbìrem)

% Nalezení nejbližšího obrazu
[skok, x_next] = closest_image(x, distance_matrix);

prubeh_skok(1) = skok;

% vyøíznutí pøedchozího obrazu z matice
distance_matrix(x, :) = [];
distance_matrix(:, x) = [];

%% POSTUPNÉ SKOKY NA DALŠÍ NEJBLIŽŠÍ OBRAZ

for i=2:length(orizla_data)-1
    
    x = x_next;
    [skok, x_next] = closest_image(x, distance_matrix);
    
    prubeh_skok(i) = skok;
    
    % vyøíznutí pøedchozího obrazu z matice
    distance_matrix(x, :) = [];
    distance_matrix(:, x) = [];
end

%% VYHODNOCENÍ
skok_limit = max(prubeh_skok) / 2;
pocet_trid_MRM = 1;

for i=1:length(prubeh_skok)
    if prubeh_skok(i) > skok_limit
        pocet_trid_MRM = pocet_trid_MRM + 1;
    end
end

pocet_trid = pocet_trid_MRM;

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

%% VYKRESLENÍ
figure
plot(prubeh_skok)
title('Metoda øetìzové mapy')
xlabel('Èíslo skoku')
ylabel('Velikost skoku')

%% PROÈIŠTÌNÍ WORKSPACE
vars = {'diff','distance_matrix','i', 'j', 'prubeh_skok', 'skok', 'x', 'x_next', 'skok_limit'};
clear(vars{:})
clear vars
vars = {'i','orizla_data','prubeh_skok', 'skok', 'x', 'x_next', 'skok_limit', 'distance_matrix'};
clear(vars{:})
clear vars
