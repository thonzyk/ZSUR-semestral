%% --UR�EN� PO�TU T��D POMOC� METODY SHLUKOV� HLADINY-- %%

%% INICIALIZACE

% Vzhledem ke zp�sobu generov�n� tr�novac�ch dat posta�� pro ur�en� t��d
% pou��t v��ez �ekn�me prvn� setina dat.
orizla_data = data(1:ceil(length(data)/100), :);
shluky = orizla_data;

prubeh_h = -1 * ones(length(shluky)-1, 1); % Pr�b�h zm�ny h

% Indexy bod�, kter� maj� b�t spojeny
% - inicializov�no na "nesmyslnou hodnotu"
shluk_to_merge_1 = -1;
shluk_to_merge_2 = -1;

%% VYTVO�EN� DISTAN�N� MATICE
distance_matrix = create_dist_mat(orizla_data);

%% POSTUPN� SJEDNOCOV�N� JEDNOTLIV�CH SHLUK�

for i=1:length(orizla_data)-2
    
    [min_dist, shluk_to_merge_1, shluk_to_merge_2] = triangular_mat_min(distance_matrix);
    
    prubeh_h(i) = min_dist;
    
    new_shluk = (shluky(shluk_to_merge_1, :) + shluky(shluk_to_merge_2, :)) / 2;
    shluky(shluk_to_merge_1, :) = [];
    shluky(shluk_to_merge_2, :) = [];
    shluky = [shluky; new_shluk];
    
    % vy��znut� odstran�n�ch shluk� z matice
    distance_matrix(shluk_to_merge_1, :) = [];
    distance_matrix(shluk_to_merge_2, :) = [];
    distance_matrix(:, shluk_to_merge_1) = [];
    distance_matrix(:, shluk_to_merge_2) = [];
    
    % roz���en� matice o nov� vznikl� slou�en� shluk
    distance_matrix = [distance_matrix zeros(length(distance_matrix), 1)];
    distance_matrix = [distance_matrix; zeros(1, length(distance_matrix))];
    % <-- TODO: OPTIMALIZOVAT
    
    for j=1:length(shluky)-1
        distance_matrix(j, end) = norm(shluky(end, :) - shluky(j, :));
    end
    
end

prubeh_h(end) = distance_matrix(1, 2); % Posledn� slou�en�

der_prubeh_h = my_derivative(prubeh_h); % Derivace pr�b�hu zm�ny h
[max_v, max_i] = max(der_prubeh_h);
inflex_point = prubeh_h(max_i);

% Po�et t��d ur��m podle indexu, u kter�ho dojde k nejv�t��mu skoku h.
[empty, pocet_trid_MSH] = max(der_prubeh_h);
pocet_trid_MSH = length(orizla_data) - pocet_trid_MSH;
pocet_trid = pocet_trid_MSH;

%% VYKRESLEN�
figure
plot(prubeh_h)
hold on
plot(max_i, inflex_point, '*m')
hold off
title('Metoda shlukov� hladiny - pr�b�h h')
xlabel('��slo iterace slou�en�')
ylabel('h')

figure
plot(der_prubeh_h)
hold on
plot(max_i, max_v, '*m')
hold off
title('Metoda shlukov� hladiny - pr�b�h zm�ny h')
xlabel('��slo iterace slou�en�')
ylabel('Zm�na h')

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

%% PRO�I�T�N� WORKSPACE

vars = {'diff','empty', 'der_prubeh_h', 'min_dist', 'new_shluk', 'prubeh_h', 'shluk_to_merge_1', 'shluk_to_merge_2', 'shluky', 'i', 'j', 'distance_matrix', 'orizla_data'};
clear(vars{:})
clear vars



