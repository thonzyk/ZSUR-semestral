function [ prumer ] = avg_vector( list_of_indx, data )

x = 0;
y = 0;

for i=list_of_indx
    vect = data(i, :);
    x = x + vect(1);
    y = y + vect(2);
end

prumer = [x y];
prumer = prumer / length(list_of_indx);

end

