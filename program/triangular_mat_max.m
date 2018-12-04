function [ max, max_i, max_j ] = triangular_mat_max( matrix )

len = length(matrix);
max = -inf;
max_i = -inf;
max_j = -inf;

for i=1:len
    for j=(i+1):len
        if matrix(i, j) > max
            max = matrix(i, j);
            max_i = i;
            max_j = j;
        end
    end
end

% [i, j] musí být sestupnì seøazené
if max_i < max_j
    pom = max_i;
    max_i = max_j;
    max_j = pom;
end

end

