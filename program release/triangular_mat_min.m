function [ min, min_i, min_j ] = triangular_mat_min( matrix )
% TRIANGULAR_MAT_MIN nalezne minim�ln� hodnotu v horn� troj�heln�kov�
% matici. Vr�t� hodnotu a jej� sou�adnice.

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

% [i, j] mus� b�t sestupn� se�azen�
if min_i < min_j
    pom = min_i;
    min_i = min_j;
    min_j = pom;
end

end

