function [ dist_vect ] = sum_dists( distance_matrix, stredy_array )
%SUM_DISTS vrátí sumu vzdáleností od jednotlivých bodù

dist_vect = zeros(1, length(distance_matrix));
for stred_i=1:length(stredy_array)
    
   stred = stredy_array(stred_i);
   
   for i=stred+1:length(distance_matrix)
       dist_vect(i) = dist_vect(i) + distance_matrix(stred, i);
   end
   for i=1:stred-1
       dist_vect(i) = dist_vect(i) + distance_matrix(i, stred);
   end
end

end

