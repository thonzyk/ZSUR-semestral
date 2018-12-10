function [ prumer ] = avg_vector( list_of_indx, data )
% AVG_VECTOR vr�t� pr�m�rn� vektor na z�klad� seznamu index� a dat

data_dimension = length(data(1, :));

vect = zeros(1, data_dimension);

for i=list_of_indx
    vect = vect + data(i, :);
end

prumer = vect / length(list_of_indx);

end

