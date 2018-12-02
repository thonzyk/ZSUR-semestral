function [ min min_i min_j ] = triangular_mat_min( matrix )

len = length(matrix);
min = inf;
min_i = -inf;
min_j = -inf;

for i=1:len
    for j=(i+1):len
        if matrix(i, j) < min
            min = matrix(i, j);
            min_i = i;
            min_j = j;
        end
    end
end

% [i, j] musí být sestupnì seøazené
if min_i < min_j
    pom = min_i;
    min_i = min_j;
    min_j = pom;
end

end

