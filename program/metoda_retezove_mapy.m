%% --URÈENÍ POÈTU TØÍD POMOCÍ METODY ØETÌZOVÉ MAPY-- %%

% Vzhledem ke zpùsobu generování trénovacích dat postaèí pro urèení tøíd
% použít výøez dat (napø. setina).
orizla_data = data(1:ceil(length(data)/100), :);

prubeh_skok = -1 * ones(length(orizla_data)-2, 1); % Prùbìh velikosti skoku k dalšímu obrazu

%% VYTVOØENÍ DISTANÈNÍ MATICE
distance_matrix = create_dist_mat(orizla_data);

%% INICIALIZACE

x = ceil(rand*length(orizla_data)); % index obrazu x v datech (inicializace náhodným výbìrem)

plot_points = orizla_data(x, :);

% Nalezení nejbližšího obrazu
[skok, x_next] = closest_image(x, distance_matrix);

prubeh_skok(1) = skok;

% Vyøíznutí pøedchozího obrazu z matice
distance_matrix(x, :) = [];
distance_matrix(:, x) = [];
orizla_data(x, :) = [];

%% POSTUPNÉ SKOKY NA DALŠÍ NEJBLIŽŠÍ OBRAZ

for i=2:length(orizla_data)-1
    
    x = x_next;
    [skok, x_next] = closest_image(x, distance_matrix);
    
    prubeh_skok(i) = skok;
    
    plot_points = [plot_points; orizla_data(x, :)];
    
    % vyøíznutí pøedchozího obrazu z matice
    distance_matrix(x, :) = [];
    distance_matrix(:, x) = [];
    orizla_data(x, :) = [];

end

%% VYHODNOCENÍ
skok_limit = max(prubeh_skok) / 2;
pocet_trid_MRM = 1;
prechody_i = [];

for i=1:length(prubeh_skok)
    if prubeh_skok(i) > skok_limit
        pocet_trid_MRM = pocet_trid_MRM + 1;
        prechody_i = [prechody_i i];
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
title('Metoda øetìzové mapy - prùbìh skoku')
xlabel('Èíslo skoku')
ylabel('Velikost skoku')

figure
hold on
plot(plot_points(1, 1)+center(1), plot_points(1, 2)+center(2), '*r')
plot(plot_points(end, 1)+center(1), plot_points(end, 2)+center(2), '*b')

for i=1:length(plot_points)-1
    if ismember(i, prechody_i)
        line([plot_points(i, 1)+center(1) plot_points(i+1, 1)+center(1)], [plot_points(i, 2)+center(2) plot_points(i+1, 2)+center(2)], 'Color', 'm')
    else
        line([plot_points(i, 1)+center(1) plot_points(i+1, 1)+center(1)], [plot_points(i, 2)+center(2) plot_points(i+1, 2)+center(2)])
    end
    
end

title('Metoda øetìzové mapy - vizualizace')
xlabel('Èíslo skoku')
ylabel('Velikost skoku')
legend('start', 'konec')
hold off
axis([min_data_value(1)+center(1) max_data_value(1)+center(1) min_data_value(2)+center(2) max_data_value(2)+center(2)]) 



%% PROÈIŠTÌNÍ WORKSPACE
vars = {'diff','distance_matrix','i', 'j', 'prubeh_skok', 'skok', 'x', 'x_next', 'skok_limit'};
clear(vars{:})
clear vars
vars = {'i','orizla_data','prubeh_skok', 'skok', 'x', 'x_next', 'skok_limit', 'distance_matrix', 'prechody_i', 'plot_points'};
clear(vars{:})
clear vars
