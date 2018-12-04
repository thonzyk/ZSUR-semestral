%% --ROZTØÍDÌNÍ OBRAZÙ DO TØÍD METODOU BAYESOVA KLASIFIKÁTORU-- %%

load_class_identity

patterns_count = length(data);

class_probability = patterns_in_class / patterns_count;

intervals_per_dimension = 3; % data budou diskretizována na k

discrete_data = discretize_data(data, intervals_per_dimension);

patterns_dimension = length(data(1, :));

count_of_int_in_css = zeros(intervals_per_dimension, class_count, patterns_dimension);

%% SESTAVENÍ MATICE count_of_int_in_css

for i=1:length(discrete_data)
    for dimension=1:patterns_dimension
        count_of_int_in_css(discrete_data(i, dimension), class_identity(i), dimension) = count_of_int_in_css(discrete_data(i, dimension), class_identity(i), dimension) + 1;
    end
end






















