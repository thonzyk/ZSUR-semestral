%% --UPRAVEN� METODA ITERATIVN� OPTIMALIZACE-- %%

% Po�et ethalon� pro ka�dou t��du - ethalony by m�li pro na�e ��ely
% popisovat shluk l�pe ne� samotn� centroid
number_of_ethalons = 10;

ethalons_cell = {};

for i=1:pocet_trid
    shluk = shluky_cell{i};
    vyrez_shluku = shluk(1:number_of_ethalons);
    ethalons_cell{i} = vyrez_shluku;
end


for shluk_1_i=1:length(shluky_cell)
    for shluk_2_i=1:length(shluky_cell)
        
        if shluk_1_i == shluk_2_i
            continue
        end
        
        shluk_1 = shluky_cell{shluk_1_i};
        shluk_2 = shluky_cell{shluk_2_i};
        ethalons_1 = ethalons_cell{shluk_1_i};
        ethalons_2 = ethalons_cell{shluk_2_i};
        
        for obraz_i=length(shluk_1):-1:1
            
            obraz = data(shluk_1(obraz_i), :);
            
            j_1_ubytek = 0;
            j_2_prirustek = 0;
            
            for ethalon_i=1:number_of_ethalons
                
                ethalon_1 = data(ethalons_1(ethalon_i), :);
                ethalon_2 = data(ethalons_2(ethalon_i), :);
                
                j_1_ubytek = j_1_ubytek + norm_na_2(obraz, ethalon_1);
                j_2_prirustek = j_2_prirustek + norm_na_2(obraz, ethalon_2);
            end
            
            if j_1_ubytek > j_2_prirustek
                shluk_2(end+1) = shluk_1(obraz_i);
                shluk_1(obraz_i) = [];
            end
        end
        
        shluky_cell{shluk_1_i} = shluk_1;
        shluky_cell{shluk_2_i} = shluk_2;
    end
end

%% ZM�NA CLASS_IDENTITY

for shluk_i=1:length(shluky_cell)
    for i=shluky_cell{shluk_i}
        class_identity(i) = shluk_i;
    end
end

%% VYKRESLEN�
figure
plot_data
title('Upraven� iterativn� optimalizace')
xlabel('x_1')
ylabel('x_2')

%% Z�PIS DO SOUBORU
% if exist('class_identity.txt', 'file') == 2
%      delete class_identity.txt
% end
% 
% % % V p��pad� verze R2017b a vy���
% % -->
% % if isfile('class_identity.txt')
% %     delete class_identity.txt
% % end
% % <--
% 
% write_my_data(class_identity, 'class_identity');

%% PRO�I�T�N� WORKSPACE
vars = {'i', 'j_1_ubytek', 'j_2_prirustek', 'obraz', 'obraz_i', 'shluk_1', 'shluk_2',  'shluk_1_i', 'shluk_2_i',  'ethalon_i', 'ethalon_1', 'ethalon_2', 'ethalons_1', 'ethalons_2', 'ethalons_cell', 'number_of_ethalons', 'shluk', 'shluk_i', 'vyrez_shluku'};
clear(vars{:})
clear vars


