%% --ROZT��D�N� OBRAZ� DO T��D METODOU BAYESOVA KLASIFIK�TORU-- %%



shluky = {T_1, T_2, T_3};

mi_cell = cell(1, length(shluky));
sigma_cell = cell(1, length(shluky));

% Ur�en� st�edn� hodnoty norm�ln�ho rozd�len�
for shluk_i=1:length(shluky)
    mi = zeros(1, data_dimension);
    shluk = shluky{shluk_i};
    obrazu_in_shluk = length(shluk);
    
    
    for obraz_i=1:length(shluk)
        mi = mi + data(shluk(obraz_i), :);
    end
    
    mi = mi / obrazu_in_shluk;
    mi_cell{shluk_i} = mi;
end

% Ur�en� rozptylov� matice norm�ln�ho rozd�len�
for shluk_i=1:length(shluky)
    sigma = zeros(data_dimension);
    shluk = shluky{shluk_i};
    obrazu_in_shluk = length(shluk);
    
    for obraz_i=1:length(shluk)
        
        x_minus_mi = ( data(shluk(obraz_i), :) - mi_cell{shluk_i} );
        
        sigma = sigma + x_minus_mi' * x_minus_mi;
    end
    
    sigma = sigma / obrazu_in_shluk;
    sigma_cell{shluk_i} = sigma;
end

%% VYKRESLEN�






