%% --METODA ITERATIVNÍ OPTIMALIZACE-- %%

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

%% ZMÌNA CLASS_IDENTITY

for shluk_i=1:length(shluky_cell)
    for i=shluky_cell{shluk_i}
        class_identity(i) = shluk_i;
    end
end

plot_data