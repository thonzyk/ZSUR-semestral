%% ROZTØÍDÌNÍ DAT POMOCÍ METODY MINIMÁLNÍ VZDÁLENOSTI

% Použiji støedy urèené pøedchozími metodami

figure
hold on

for x_1=min_data_value(1):rastr:max_data_value(1)
    for x_2=min_data_value(2):rastr:max_data_value(2)
        
        distances = zeros(1, length(stredy_matrix));
        
        pattern = [x_1 x_2];
        
        for stred=1:length(stredy_matrix)
            distances(stred) = norm_na_2(pattern, stredy_matrix(stred, :));
        end
        
        [closest, closest_index] = min(distances);
        
        class_color = my_colors_secondary{closest_index};
        
        sz = 10;
        scatter(x_1+center(1), x_2+center(2), sz, 'MarkerEdgeColor', class_color)
    end
end

plot_data
hold off
axis([min_data_value(1)+center(1) max_data_value(1)+center(1) min_data_value(2)+center(2) max_data_value(2)+center(2)]) 
title('Metoda minimální vzdálenosti')
xlabel('x_1')
ylabel('x_2')

%% PROÈIŠTÌNÍ WORKSPACE
vars = {'class_color','closest','closest_index', 'css_identity', 'distances', 'i', 'pattern', 'stred', 'sz', 'x_1', 'x_2', 'ans', 'css_index'};
clear(vars{:})
clear vars
