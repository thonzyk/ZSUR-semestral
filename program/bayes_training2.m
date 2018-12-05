%% --ROZTØÍDÌNÍ OBRAZÙ DO TØÍD METODOU BAYESOVA KLASIFIKÁTORU-- %%

figure %
hold on %

[empty, interval_length1] = discretize_data(data, 1);


for k=1:-0.1:0.1
    
    interval_length = interval_length1*k;
    
    load_class_identity
    
    patterns_count = length(data);
    
    class_probability = patterns_in_class / patterns_count;
    
    %intervals_per_dimension = 2; % data budou diskretizována na k
    
    discrete_data = discretize_data2(data, interval_length);
    
    patterns_dimension = length(data(1, :));
    
    intervals_per_dimension = 1/k;
    
    count_of_int_in_css = zeros(ceil(intervals_per_dimension), class_count, patterns_dimension);
    
    %% SESTAVENÍ MATICE count_of_int_in_css
    
    for i=1:length(discrete_data)
        for dimension=1:patterns_dimension
            count_of_int_in_css(discrete_data(i, dimension), class_identity(i), dimension) = count_of_int_in_css(discrete_data(i, dimension), class_identity(i), dimension) + 1;
        end
    end
    
    %% VYKRESLENÍ
    
    
    for i=1:intervals_per_dimension
        for j=1:intervals_per_dimension
            
            x_1 = min_data_value(1) + (i-1) * interval_length(1);
            x_2 = min_data_value(2) + (j-1) * interval_length(2);
            position = [x_1 x_2 interval_length(1) interval_length(2)];
            
            
            obraz = [i j];
            bayes_classify
            
            switch max_probability_index
                case 1
                    class_color = [.6 .2 .2];
                case 2
                    class_color = [.2 .6 .2];
                case 3
                    class_color = [.2 .2 .6];
                otherwise
                    continue
            end
            
            
            rectangle('Position', position, 'FaceColor', class_color, 'EdgeColor', class_color)
        end
    end
    
end

plot_data

hold off


















