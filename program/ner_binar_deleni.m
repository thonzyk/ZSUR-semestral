%% --ROZT��D�N� OBRAZ� DO T��D METODOU NEROVNOM�RN�HO BIN�RN�HO D�LEN�-- %%
% UPOZORN�N�: Metoda p�euspo��d� po�ad� dat

load_data

% Seznam shluk�
shluky_cell = {};

% Shluk ur�en� k rozd�len�
shluk_to_split = data;

%% POSTUPN� D�LEN� SHLUK�
for loop_i=1:pocet_trid-1
    
    % Pracovn� shluky na kter� se rozpadne shluk_to_split
    pracovni_shluk_1 = [];
    pracovni_shluk_2 = [];
    
%     mira_orezu = 400/(loop_i*2);
%     orizly_shluk = shluk_to_split(1:ceil(length(data)/mira_orezu), :);
    orizly_shluk = shluk_to_split;
    
    % Distan�n� matice
    distance_matrix = create_dist_mat(orizly_shluk);
    
    % Nalezen� dvou nejvzd�len�j��ch bod�
    [ empty, obraz_1_i, obraz_2_i ] = triangular_mat_max(distance_matrix);
    
    s_1 = shluk_to_split(obraz_1_i, :);
    s_2 = shluk_to_split(obraz_2_i, :);
    
    % Distan�n� matice pot�ebn� pro rozd�len� do dvou nov�ch shluk�
    dist_mat_bin = create_dist_mat_bin(shluk_to_split, s_1, s_2);
    
    % Rozd�len� shluk_to_split
    for i=1:length(dist_mat_bin)
        if dist_mat_bin(i, 1) < dist_mat_bin(i, 2)
            pracovni_shluk_1 = [pracovni_shluk_1; shluk_to_split(i, :)];
        else
            pracovni_shluk_2 = [pracovni_shluk_2; shluk_to_split(i, :)];
        end
    end
    
    % Ur�en� st�ed� nov� vznikl�ch shluk�
    stred_1 = sum(pracovni_shluk_1) / length(pracovni_shluk_1);
    stred_2 = sum(pracovni_shluk_2) / length(pracovni_shluk_2);
    
    % Ur�en� J pro oba shluky
    J_pracovni_shluk_1 = J_shluku(pracovni_shluk_1, stred_1);
    J_pracovni_shluk_2 = J_shluku(pracovni_shluk_2, stred_2);
       
    % V�b�r shluku s vy���m J
    if J_pracovni_shluk_1 > J_pracovni_shluk_2
        shluk_to_split = pracovni_shluk_1;
        shluky_cell{end+1} = pracovni_shluk_2;
    else
        shluk_to_split = pracovni_shluk_2;
        shluky_cell{end+1} = pracovni_shluk_1;
    end
end
shluky_cell{end+1} = shluk_to_split;

%% P�euspo��d�n� dat
data = zeros(length(data), data_dimension);
class_identity = zeros(length(data), 1);
shluky_cell_2 = cell(1, pocet_trid);

loop_index = 1;
for shluk_i=1:length(shluky_cell)
    shluk = shluky_cell{shluk_i};
    shluk_2 = zeros(1, length(shluk));
   for obraz_i=1:length(shluk)
       data(loop_index, :) = shluk(obraz_i, :);
       class_identity(loop_index) = shluk_i;
       shluk_2(obraz_i) = loop_index;
       loop_index = loop_index + 1;
   end
   shluky_cell_2{shluk_i} = shluk_2;
end


%% V�PO�ET ST�ED� SHLUK�
stredy_matrix = zeros(pocet_trid, data_dimension);

for i=1:length(shluky_cell)
    shluk = shluky_cell{i};
    stredy_matrix(i, :) = mean(shluk);
end

J = 0;
for i=1:pocet_trid
    J = J + J_shluku(shluky_cell{i}, stredy_matrix(i, :));
end
title_name = ['Nerovnom�rn� bin�rn� d�len� - J: ', num2str(round(J))];

%% Z�PIS DO SOUBORU
if exist('class_identity.txt', 'file') == 2
     delete class_identity.txt
end

% % V p��pad� verze R2017b a vy���
% -->
% if isfile('class_identity.txt')
%     delete class_identity.txt
% end
% <--

write_my_data(class_identity, 'class_identity');
shluky_cell = shluky_cell_2;

%% VYKRESLEN�
figure
plot_data
title(title_name)
xlabel('x_1')
ylabel('x_2')

%% PRO�I�T�N� WORKSPACE
vars = {'dist_mat_bin','distance_matrix','empty', 'i', 'J_pracovni_shluk_1', 'J_pracovni_shluk_2', 'loop_i', 'loop_index', 'obraz_1_i', 'obraz_2_i', 'obraz_i', 'pracovni_shluk_1', 'pracovni_shluk_2', 'shluk', 'shluk_i', 'shluk_to_split', 'stred_1', 'stred_2', 'shluky_cell_2', 's_1', 's_2', 'orizly_shluk', 'mira_orezu', 'shluk_2', 'ans', 'css_identity'};
clear(vars{:})
clear vars
