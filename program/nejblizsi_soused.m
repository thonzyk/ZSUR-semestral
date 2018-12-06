%% ROZTØÍDÌNÍ DAT POMOCÍ METODY MINIMÁLNÍ VZDÁLENOSTI

ethalony = {T_1, T_2, T_3};

biggest_class_size = 0;

for css=1:length(ethalony)
    if length(ethalony(css)) > biggest_class_size
        biggest_class_size = length(ethalony(css));
    end
end

rastr = 0.5;

figure
hold on

for x_1=min_data_value(1):rastr:max_data_value(1)
    for x_2=min_data_value(2):rastr:max_data_value(2)
        
        pattern = [x_1 x_2];
        min_distance = inf;
        min_distance_index = -1;
        
        for css_index=1:length(ethalony)
            for ethalon_index=1:length(ethalony(css_index))
                
                css = ethalony{css_index};
                ethalon = data(css(ethalon_index), :);
                
                if norm2(pattern, ethalon) < min_distance
                    min_distance = norm2(pattern, ethalon);
                    min_distance_index = css_index;
                end
            end
        end
        
        switch min_distance_index
            case 1
                class_color = [.65 .15 .15];
            case 2
                class_color = [.15 .65 .15];
            case 3
                class_color = [.15 .15 .65];
            otherwise
                class_color = 'k';
        end
        
        sz = 10;
        scatter(x_1, x_2, sz, 'MarkerEdgeColor', class_color)
        
    end
end

plot_data




