%% --METODA ITERATIVN� OPTIMALIZACE-- %%

shluky_cell = {T_1, T_2, T_3};
stredy_array = [stred_1; stred_2; stred_3];

for shluk_1_i=1:length(shluky_cell)
    for shluk_2_i=1:length(shluky_cell)
        
        if shluk_1_i == shluk_2_i
            continue
        end
        
        shluk_1 = shluky_cell{shluk_1_i};
        shluk_2 = shluky_cell{shluk_2_i};
        stred1 = stredy_array(shluk_1_i, :);
        stred2 = stredy_array(shluk_2_i, :);
        
        for obraz_i=length(shluk_1):-1:1
            
            obraz = data(shluk_1(obraz_i), :);
            
            j_1_ubytek = norm2(obraz, stred1);
            
            j_2_prirustek = norm2(obraz, stred2);
            
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

for i=shluky_cell{1}
    class_identity(i) = 1;
end

for i=shluky_cell{2}
    class_identity(i) = 2;
end

for i=shluky_cell{3}
    class_identity(i) = 3;
end

plot_data