%% ROZTØÍDÌNÍ DAT POMOCÍ METODY MINIMÁLNÍ VZDÁLENOSTI

% Použiji støedy urèené pomocí k_means

stredy = [stred_1; stred_2; stred_3];

rastr = 2; %0.2 pro obrazek -> 113 vteøin

figure
hold on

for x_1=min_data_value(1):rastr:max_data_value(1)
    for x_2=min_data_value(2):rastr:max_data_value(2)
        
        distances = zeros(1, length(stredy));
        
        pattern = [x_1 x_2];
        
        for stred=1:length(stredy)
            distances(stred) = norm2(pattern, stredy(stred, :));
        end
        
        [closest, closest_index] = min(distances);
        
        
        switch closest_index
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

hold off

axis(1.1*[min_data_value(1) max_data_value(1) min_data_value(2) max_data_value(2)]);
