function [ distance2 ] = norm2( vector_1, vector_2 )

distance2 = 0;

for i=1:length(vector_1)
    distance2 = distance2 + ( vector_1(i) - vector_2(i) )^2;
end

end

