%% --UR�EN� PO�TU T��D POMOC� METODY �ET�ZOV� MAPY-- %%

% Vzhledem ke zp�sobu generov�n� tr�novac�ch dat posta�� pro ur�en� t��d
% pou��t v��ez dat (nap�. setina).
orizla_data = data(1:ceil(length(data)/100), :);

prubeh_skok = -1 * ones(length(orizla_data)-2, 1); % Pr�b�h velikosti skoku k dal��mu obrazu

%% VYTVO�EN� DISTAN�N� MATICE
distance_matrix = create_dist_mat(orizla_data);

%% INICIALIZACE

x = ceil(rand*length(orizla_data)); % index obrazu x v datech (inicializace n�hodn�m v�b�rem)

plot_points = orizla_data(x, :);

% Nalezen� nejbli���ho obrazu
[skok, x_next] = closest_image(x, distance_matrix);

prubeh_skok(1) = skok;

% Vy��znut� p�edchoz�ho obrazu z matice
distance_matrix(x, :) = [];
distance_matrix(:, x) = [];
orizla_data(x, :) = [];

%% POSTUPN� SKOKY NA DAL�� NEJBLI��� OBRAZ

for i=2:length(orizla_data)-1
    
    x = x_next;
    [skok, x_next] = closest_image(x, distance_matrix);
    
    prubeh_skok(i) = skok;
    
    plot_points = [plot_points; orizla_data(x, :)];
    
    % vy��znut� p�edchoz�ho obrazu z matice
    distance_matrix(x, :) = [];
    distance_matrix(:, x) = [];
    orizla_data(x, :) = [];

end

%% VYHODNOCEN�
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

%% Z�PIS DO SOUBORU
if exist('pocet_trid.txt', 'file') == 2
     delete pocet_trid.txt
end

% % V p��pad� verze R2017b a vy���
% -->
% if isfile('cpocet_trid.txt')
%     delete pocet_trid.txt
% end
% <--

write_my_data(pocet_trid, 'pocet_trid');

%% VYKRESLEN�
figure
plot(prubeh_skok)
title('Metoda �et�zov� mapy - pr�b�h skoku')
xlabel('��slo skoku')
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

title('Metoda �et�zov� mapy - vizualizace')
xlabel('��slo skoku')
ylabel('Velikost skoku')
legend('start', 'konec')
hold off
axis([min_data_value(1)+center(1) max_data_value(1)+center(1) min_data_value(2)+center(2) max_data_value(2)+center(2)]) 



%% PRO�I�T�N� WORKSPACE
vars = {'diff','distance_matrix','i', 'j', 'prubeh_skok', 'skok', 'x', 'x_next', 'skok_limit'};
clear(vars{:})
clear vars
vars = {'i','orizla_data','prubeh_skok', 'skok', 'x', 'x_next', 'skok_limit', 'distance_matrix', 'prechody_i', 'plot_points'};
clear(vars{:})
clear vars
