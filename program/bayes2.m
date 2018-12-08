%% --ROZTØÍDÌNÍ OBRAZÙ DO TØÍD METODOU BAYESOVA KLASIFIKÁTORU-- %%

rastr = .5;

shluky = {T_1, T_2, T_3};

mi_cell = cell(1, length(shluky));
sigma_cell = cell(1, length(shluky));
norm_rozlozeni_cell = cell(1, length(shluky));

% Urèení støední hodnoty normálního rozdìlení
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

% Body pro výpoèet normálního rozložení
x1 = min_data_value(1):rastr:max_data_value(1);
x2 = min_data_value(2):rastr:max_data_value(2);
[X1,X2] = meshgrid(x1,x2);

% Urèení rozptylové matice normálního rozdìlení + urèení samotného
% normálního rozložení
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
    
    norm_rozlozeni = mvnpdf([X1(:) X2(:)],mi_cell{shluk_i},sigma);
    norm_rozlozeni = reshape(norm_rozlozeni,length(x2),length(x1));
    
    norm_rozlozeni_cell{shluk_i} = norm_rozlozeni;
end

%% VYKRESLENÍ

figure
hold on

x_1_index = 1;
for x_1=min_data_value(1):rastr:max_data_value(1)
    
   x_2_index = 1;
    
    for x_2=min_data_value(2):rastr:max_data_value(2)
        
        best_rozlozeni_index = -1;
        highest_probability = 0;
        for rozlozeni_index=1:length(norm_rozlozeni_cell)
            
            rozlozeni = norm_rozlozeni_cell{rozlozeni_index};
            probabl = rozlozeni(x_2_index, x_1_index);
            
            if probabl > highest_probability
                highest_probability = probabl;
                best_rozlozeni_index = rozlozeni_index;
            end
        end
        
        class_color = my_colors_main(best_rozlozeni_index);
        
        sz = 10;
        scatter(x_1, x_2, sz, 'MarkerEdgeColor', class_color)
        
        x_2_index = x_2_index+1;
    end
    x_1_index = x_1_index+1;
end

plot_data

hold off

axis(1.1*[min_data_value(1) max_data_value(1) min_data_value(2) max_data_value(2)]);




