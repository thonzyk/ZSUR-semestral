%% --UR�EN� PO�TU T��D POMOC� METODY �ET�ZOV� MAPY-- %%

% Vzhledem ke zp�sobu generov�n� tr�novac�ch dat posta�� pro ur�en� t��d
% pou��t v��ez �ekn�me prvn� setina dat.
orizla_data = data(1:ceil(length(data)/100), :);

prubeh_skok = -1 * ones(length(orizla_data)-2, 1); % Pr�b�h velikosti skoku k dal��mu obrazu

%% VYTVO�EN� DISTAN�N� MATICE
distance_matrix = create_dist_mat(orizla_data);

%% INICIALIZACE

x = ceil(rand*length(orizla_data)); % index obrazu x v datech (inicializace n�hodn�m v�b�rem)

% Nalezen� nejbli���ho obrazu
[skok, x_next] = closest_image(x, distance_matrix);

prubeh_skok(1) = skok;

% vy��znut� p�edchoz�ho obrazu z matice
distance_matrix(x, :) = [];
distance_matrix(:, x) = [];

%% POSTUPN� SKOKY NA DAL�� NEJBLI��� OBRAZ

for i=2:length(orizla_data)-1
    
    x = x_next;
    [skok, x_next] = closest_image(x, distance_matrix);
    
    prubeh_skok(i) = skok;
    
    % vy��znut� p�edchoz�ho obrazu z matice
    distance_matrix(x, :) = [];
    distance_matrix(:, x) = [];
end

%% VYHODNOCEN�
skok_limit = max(prubeh_skok) / 2;
pocet_trid_MRM = 1;

for i=1:length(prubeh_skok)
    if prubeh_skok(i) > skok_limit
        pocet_trid_MRM = pocet_trid_MRM + 1;
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
title('Metoda �et�zov� mapy')
xlabel('��slo skoku')
ylabel('Velikost skoku')

%% PRO�I�T�N� WORKSPACE
vars = {'diff','distance_matrix','i', 'j', 'prubeh_skok', 'skok', 'x', 'x_next', 'skok_limit'};
clear(vars{:})
clear vars
vars = {'i','orizla_data','prubeh_skok', 'skok', 'x', 'x_next', 'skok_limit', 'distance_matrix'};
clear(vars{:})
clear vars
