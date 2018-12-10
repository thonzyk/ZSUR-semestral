function [ distance_na_2 ] = norm_na_2( vector_1, vector_2 )

distance_na_2 = 0;

for i=1:length(vector_1)
    distance_na_2 = distance_na_2 + ( vector_1(i) - vector_2(i) )^2;
end

end

