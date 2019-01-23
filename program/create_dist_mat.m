function [ distance_matrix ] = create_dist_mat( data )
% CREATE_DIST_MAT Vytvo�� horn� troj�heln�kovou matici mapuj�c� vzd�lenosti
% jednotliv�ch obraz� v datech.
%
% Prvek na na sou�adnici [i, j] respektive [j, i] odpov�d� euklidovsk�
% vzd�lenosti i-t�ho a j-t�ho obrazu v datech.

distance_matrix = zeros(length(data), length(data));
for i=1:length(data)
    for j=(i+1):length(data)
        diff = norm(data(i, :) - data(j, :));
        distance_matrix(i, j) = diff;
    end
end

end
