function [ prumer ] = avg_vector( list_of_indx, data )
% AVG_VECTOR vrátí prùmìrný vektor na základì seznamu indexù a dat

data_dimension = length(data(1, :));

vect = zeros(1, data_dimension);

for i=list_of_indx
    vect = vect + data(i, :);
end

prumer = vect / length(list_of_indx);

end

