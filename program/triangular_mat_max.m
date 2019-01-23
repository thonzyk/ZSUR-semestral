function [ max_value, max_i, max_j ] = triangular_mat_max( matrix )
% TRIANGULAR_MAT_MAX nalezne maxim�ln� hodnotu v horn� troj�heln�kov�
% matici. Vr�t� hodnotu a jej� sou�adnice.

len = length(matrix);
max_value = -inf;
max_i = -inf;
max_j = -inf;

for i=1:len
    for j=(i+1):len
        if matrix(i, j) > max_value
            max_value = matrix(i, j);
            max_i = i;
            max_j = j;
        end
    end
end

% [i, j] mus� b�t sestupn� se�azen�
if max_i < max_j
    pom = max_i;
    max_i = max_j;
    max_j = pom;
end

end

