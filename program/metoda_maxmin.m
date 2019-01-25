%% --URÈENÍ POÈTU TØÍD POMOCÍ METODY MAXMIN-- %%

% Vzhledem ke zpùsobu generování trénovacích dat postaèí pro urèení tøíd
% použít výøez dat (napø. setina).
orizla_data = data(1:ceil(length(data)/100), :);

%% VYTVOØENÍ DISTANÈNÍ MATICE
distance_matrix = create_dist_mat(orizla_data);

%% INICIALIZACE

% Hodnota q byla urèena experimentálnì
q = 0.6;

[ max_value, max_i, max_j ] = triangular_mat_max(distance_matrix);

list_shluku = [max_i max_j];
list_shluku = sort(list_shluku);

prumer_vzdalenosti_shluku = max_value;

[next_shluk, next_shluk_vzdalenost] = find_next_shluk(distance_matrix, list_shluku);

while next_shluk_vzdalenost > q*prumer_vzdalenosti_shluku
    list_shluku = [list_shluku next_shluk];
    list_shluku = sort(list_shluku);
    prumer_vzdalenosti_shluku = ( ( (length(list_shluku)-1) * prumer_vzdalenosti_shluku ) + next_shluk_vzdalenost ) / length(list_shluku);
    
    [next_shluk, next_shluk_vzdalenost] = find_next_shluk(distance_matrix, list_shluku);
end

pocet_trid_MMM = length(list_shluku);
pocet_trid = pocet_trid_MMM;

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

vars = {'distance_matrix','list_shluku','max_i', 'max_j', 'max_value', 'next_shluk', 'next_shluk_vzdalenost', 'prumer_vzdalenosti_shluku', 'q', 'i', 'orizla_data'};
clear(vars{:})
clear vars
