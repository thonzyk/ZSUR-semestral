%% --METODA ITERATIVN� OPTIMALIZACE-- %%

for shluk_1_i=1:length(shluky_cell)
    for shluk_2_i=1:length(shluky_cell)
        
        if shluk_1_i == shluk_2_i
            continue
        end
        
        shluk_1 = shluky_cell{shluk_1_i};
        shluk_2 = shluky_cell{shluk_2_i};
        stred1 = stredy_matrix(shluk_1_i, :);
        stred2 = stredy_matrix(shluk_2_i, :);
        
        for obraz_i=length(shluk_1):-1:1
            
            obraz = data(shluk_1(obraz_i), :);
            
            j_1_ubytek = norm_na_2(obraz, stred1);
            
            j_2_prirustek = norm_na_2(obraz, stred2);
            
            if j_1_ubytek > j_2_prirustek
                shluk_2(end+1) = shluk_1(obraz_i);
                shluk_1(obraz_i) = [];
            end
        end
        
        shluky_cell{shluk_1_i} = shluk_1;
        shluky_cell{shluk_2_i} = shluk_2;
    end
end

%% VYKRESLEN�
figure
plot_data
title('Iterativn� optimalizace')
xlabel('x_1')
ylabel('x_2')

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

%% PRO�I�T�N� WORKSPACE
vars = {'i', 'j_1_ubytek', 'j_2_prirustek', 'obraz', 'obraz_i', 'shluk_1', 'shluk_2',  'shluk_1_i', 'shluk_2_i', 'stred1', 'stred2', 'ans', 'css_identity'};
clear(vars{:})
clear vars