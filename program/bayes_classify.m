

obraz = [2 3];

probabilities = zeros(1, length(count_of_int_in_css(1, :, 1)));

for class=1:length(probabilities)
    
    probabilities(class) = class_probability(class);
    
    for dimension=1:patterns_dimension
        
        prunik_x_css = count_of_int_in_css(obraz(dimension), class, dimension);
        
        pocet_v_css = patterns_in_class(class);
        
        probabilities(class) = probabilities(class) * ( prunik_x_css / pocet_v_css );
    end
end

max_probability = 0;
max_probability_index = -1;

for i=1:length(probabilities)
    if probabilities(i) > max_probability
        max_probability = probabilities(i);
        max_probability_index = i;
    end
end

fprintf('Obraz patøí do tøídy: %d\n', max_probability_index);





