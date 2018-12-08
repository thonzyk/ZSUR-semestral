function [ distance_matrix ] = create_dist_mat( data )
% CREATE_DIST_MAT Vytvoøí horní trojúhelníkovou matici mapující vzdálenosti
% jednotlivých obrazù v datech.
%
% Prvek na na souøadnici [i, j] respektive [j, i] odpovídá euklidovské
% vzdálenosti i-tého a j-tého obrazu v datech.

distance_matrix = zeros(length(data), length(data));
for i=1:length(data)
    for j=(i+1):length(data)
        diff = norm(data(i, :) - data(j, :));
        distance_matrix(i, j) = diff;
    end
end

end
