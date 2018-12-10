%% ROZTØÍDÌNÍ DAT POMOCÍ METODY MINIMÁLNÍ VZDÁLENOSTI

rastr = 5;

figure
hold on

for x_1=min_data_value(1):rastr:max_data_value(1)
    for x_2=min_data_value(2):rastr:max_data_value(2)
        
        pattern = [x_1 x_2];
        min_distance = inf;
        min_distance_index = -1;
        
        for css_index=1:length(shluky_cell)
            for ethalon_index=1:length(shluky_cell(css_index))
                
                css = shluky_cell{css_index};
                ethalon = data(css(ethalon_index), :);
                
                if norm_na_2(pattern, ethalon) < min_distance
                    min_distance = norm_na_2(pattern, ethalon);
                    min_distance_index = css_index;
                end
            end
        end
        
        class_color = my_colors_secondary{min_distance_index};
        
        sz = 10;
        scatter(x_1, x_2, sz, 'MarkerEdgeColor', class_color)
        
    end
end

plot_data
hold off
axis(1.1*[min_data_value(1) max_data_value(1) min_data_value(2) max_data_value(2)]);
title('Bayesova metoda')
xlabel('x_1')
ylabel('x_2')

%% PROÈIŠTÌNÍ WORKSPACE
vars = {'css','css_identity','ethalon', 'ethalon_index', 'i', 'min_distance', 'min_distance_index', 'pattern', 'rastr', 'sz', 'x_1', 'x_2'};
clear(vars{:})
clear vars
